class OwnPermissionsController < ApplicationController
  def index
    @own_permissions = OwnPermission.all
  end

  def show
    @own_permission = OwnPermission.find(params[:id])
  end

  def new
    @own_permission = OwnPermission.new
  end

  def create
    @own_permission = OwnPermission.new
    @own_permission.child_id = params[:child_id]

    if User.find_by({ :username => params[:username]}) == nil
      redirect_to "/own_permissions/new?child_id=#{@own_permission.child_id}&username=#{params[:username]}", :alert => "Username not found"
    else
      @own_permission.user_id = User.find_by({ :username => params[:username] }).id

      if @own_permission.save
        unless User.find(@own_permission.user_id).editable_children.include?(Child.find(@own_permission.child_id))
          edit_permission = EditPermission.new
          edit_permission.child_id = @own_permission.child_id
          edit_permission.user_id = @own_permission.user_id
          edit_permission.save

          view_permission = ViewPermission.new
          view_permission.child_id = @own_permission.child_id
          view_permission.user_id = @own_permission.user_id
          view_permission.save
        else
          unless User.find(@own_permission.user_id).viewable_children.include?(Child.find(@own_permission.child_id))
            view_permission = ViewPermission.new
            view_permission.child_id = @own_permission.child_id
            view_permission.user_id = @own_permission.user_id
            view_permission.save
          end
        end
        redirect_to "/children/#{@own_permission.child_id}/#{Date.today}", :notice => "Own Permission created successfully."
      else
        render 'new'
      end
    end
  end

  def edit
    @own_permission = OwnPermission.find(params[:id])
  end

  def update
    @own_permission = OwnPermission.find(params[:id])

    @own_permission.child_id = params[:child_id]
    @own_permission.user_id = params[:user_id]

    if @own_permission.save
      redirect_to "/children/#{@own_permission.child_id}/#{Date.today}", :notice => "Own Permission updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @own_permission = OwnPermission.find(params[:id])

    @own_permission.destroy

    redirect_to "/own_permissions", :notice => "Own Permission deleted."
  end
end
