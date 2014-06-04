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
    @view_permission.user_id = params[:user_id]

    if @view_permission.save
      redirect_to "/view_permissions", :notice => "View Permission created successfully."
    else
      render 'new'
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
      redirect_to "/view_permissions", :notice => "View Permission updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @view_permission = ViewPermission.find(params[:id])

    @view_permission.destroy

    redirect_to "/view_permissions", :notice => "View Permission deleted."
  end
end
