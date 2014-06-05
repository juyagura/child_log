class EditPermissionsController < ApplicationController
  def index
    @edit_permissions = current_user.edit_permission_controls.order("child_id desc, id desc")
  end

  def show
    @edit_permission = EditPermission.find(params[:id])
  end

  def new
    @edit_permission = EditPermission.new
  end

  def create
    @edit_permission = EditPermission.new
    @edit_permission.child_id = params[:child_id]
    if User.find_by({ :username => params[:username]}) == nil
      redirect_to "/edit_permissions/new?child_id=#{@edit_permission.child_id}&username=#{params[:username]}", :alert => "Username not found"
    else
      @edit_permission.user_id = User.find_by({ :username => params[:username]}).id

      if @edit_permission.save
        unless User.find(@edit_permission.user_id).viewable_children.include?(Child.find(@edit_permission.child_id))
          view_permission = ViewPermission.new
          view_permission.child_id = @edit_permission.child_id
          view_permission.user_id = @edit_permission.user_id
          view_permission.save
        end
        redirect_to "/children/#{@edit_permission.child_id}/#{Date.today}", :notice => "Edit Permission created successfully."
      else
        render 'new'
      end
    end
  end

  def edit
    @edit_permission = EditPermission.find(params[:id])
  end

  def update
    @edit_permission = EditPermission.find(params[:id])

    @edit_permission.child_id = params[:child_id]
    @edit_permission.user_id = params[:user_id]

    if @edit_permission.save
      redirect_to "/children/#{@edit_permission.child_id}/#{Date.today}", :notice => "Edit Permission updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @edit_permission = EditPermission.find(params[:id])

    @edit_permission.destroy

    redirect_to :back, :notice => "Edit Permission deleted."
  end
end
