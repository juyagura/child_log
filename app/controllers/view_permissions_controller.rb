class ViewPermissionsController < ApplicationController
  def index
    @view_permissions = ViewPermission.all
  end

  def show
    @view_permission = ViewPermission.find(params[:id])
  end

  def new
    @view_permission = ViewPermission.new
  end

  def create
    @view_permission = ViewPermission.new
    @view_permission.child_id = params[:child_id]
    if User.find_by({ :username => params[:username]}) == nil
      redirect_to "/view_permissions/new?child_id=#{@view_permission.child_id}&username=#{params[:username]}", :alert => "Username not found"
    else
      @view_permission.user_id = User.find_by({ :username => params[:username] }).id

      if @view_permission.save
        redirect_to "/children/#{@view_permission.child_id}/#{Date.today}", :notice => "View Permission created successfully."
      else
        render 'new'
      end
    end
  end

  def edit
    @view_permission = ViewPermission.find(params[:id])
  end

  def update
    @view_permission = ViewPermission.find(params[:id])

    @view_permission.child_id = params[:child_id]
    @view_permission.user_id = params[:user_id]

    if @view_permission.save
      redirect_to "/children/#{@view_permission.child_id}/#{Date.today}", :notice => "View Permission updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @view_permission = ViewPermission.find(params[:id])

    @view_permission.destroy

    redirect_to :back, :notice => "View Permission deleted."
  end
end
