class OwnPermissionsController < ApplicationController
  before_action(:set_own_permission, :only => [:show, :edit, :update, :destroy])
  before_action(:signed_in_user_must_be_owner, :only => [:edit, :update, :destroy])

  def set_own_permission
    @own_permission = OwnPermission.find(params[:id])
  end

  def signed_in_user_must_be_owner
    unless @own_permission.child.owning_users.include?(current_user)
      redirect_to root_url, :alert => "You do not have the permission for the action."
    end
  end

  def index
    @own_permissions = current_user.own_permission_controls.order("child_id desc, id desc")
  end

  def show
  end

  def new
    @own_permission = OwnPermission.new
  end

  def create
    @own_permission = OwnPermission.new
    @own_permission.child_id = params[:child_id]

    unless current_user.own_children.include?(Child.find(@own_permission.child_id))
      redirect_to root_url, :alert => "You do not have the permission for the action."
    else

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
          redirect_to "/children/#{@own_permission.child_id}/dayview/#{Date.today}", :notice => "Own Permission created successfully."
        else
          render 'new'
        end
      end
    end
  end

  def edit
  end

  def update
    @own_permission.child_id = params[:child_id]
    @own_permission.user_id = params[:user_id]

    if @own_permission.save
      redirect_to "/children/#{@own_permission.child_id}/dayview/#{Date.today}", :notice => "Own Permission updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    if @own_permission.user_id == current_user.id
      redirect_to :back, :alert => "You cannot delete own permission of yourself"
    else
      @own_permission.destroy

      redirect_to :back, :notice => "Own Permission deleted."
    end
  end
end
