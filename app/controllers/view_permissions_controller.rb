class ViewPermissionsController < ApplicationController
  before_action(:set_view_permission, :only => [:show, :edit, :update, :destroy])
  before_action(:signed_in_user_must_be_owner, :only => [:edit, :update, :destroy])

  def set_view_permission
    @view_permission = ViewPermission.find(params[:id])
  end

  def signed_in_user_must_be_owner
    unless @view_permission.child.owning_users.include?(current_user)
      redirect_to root_url, :alert => "You do not have the permission for the action."
    end
  end


  def index
    @view_permissions = current_user.view_permission_controls.order("child_id desc, id desc")
  end

  def show
  end

  def new
    @view_permission = ViewPermission.new
  end

  def create
    @view_permission = ViewPermission.new
    @view_permission.child_id = params[:child_id]

    unless current_user.own_children.include?(Child.find(@view_permission.child_id))
      redirect_to root_url, :alert => "You do not have the permission for the action."
    else

      if User.find_by({ :username => params[:username]}) == nil
        redirect_to "/view_permissions/new?child_id=#{@view_permission.child_id}&username=#{params[:username]}", :alert => "Username not found"
      else
        @view_permission.user_id = User.find_by({ :username => params[:username] }).id

        if @view_permission.save
          redirect_to "/children/#{@view_permission.child_id}/dayview/#{Date.today}", :notice => "View Permission created successfully."
        else
          render 'new'
        end
      end
    end
  end

  def edit
  end

  def update

    @view_permission.child_id = params[:child_id]
    @view_permission.user_id = params[:user_id]

    if @view_permission.save
      redirect_to "/children/#{@view_permission.child_id}/dayview/#{Date.today}", :notice => "View Permission updated successfully."
    else
      render 'edit'
    end
  end

  def destroy

    @view_permission.destroy

    redirect_to :back, :notice => "View Permission deleted."
  end
end
