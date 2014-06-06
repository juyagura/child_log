class EditPermissionsController < ApplicationController
  before_action(:set_edit_permission, :only => [:show, :edit, :update, :destroy])
  before_action(:signed_in_user_must_be_owner, :only => [:edit, :update, :destroy])

  def set_edit_permission
    @edit_permission = EditPermission.find(params[:id])
  end

  def signed_in_user_must_be_owner
    unless @edit_permission.child.owning_users.include?(current_user)
      redirect_to root_url, :alert => "You do not have the permission for the action."
    end
  end

  def index
    @edit_permissions = current_user.edit_permission_controls.order("child_id desc, id desc")
  end

  def show
  end

  def new
    @edit_permission = EditPermission.new
  end

  def create
    @edit_permission = EditPermission.new
    @edit_permission.child_id = params[:child_id]

    unless current_user.own_children.include?(Child.find(@edit_permission.child_id))
      redirect_to root_url, :alert => "You do not have the permission for the action."
    else

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
          redirect_to "/children/#{@edit_permission.child_id}/dayview/#{Date.today}", :notice => "Edit Permission created successfully."
        else
          render 'new'
        end
      end
    end
  end

  def edit
  end

  def update

    @edit_permission.child_id = params[:child_id]
    @edit_permission.user_id = params[:user_id]

    if @edit_permission.save
      redirect_to "/children/#{@edit_permission.child_id}/dayview/#{Date.today}", :notice => "Edit Permission updated successfully."
    else
      render 'edit'
    end
  end

  def destroy

    @edit_permission.destroy

    redirect_to :back, :notice => "Edit Permission deleted."
  end
end
