class EditPermissionsController < ApplicationController
  def index
    @edit_permissions = EditPermission.all
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
    @edit_permission.user_id = params[:user_id]

    if @edit_permission.save
      redirect_to "/edit_permissions", :notice => "Edit Permission created successfully."
    else
      render 'new'
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
      redirect_to "/edit_permissions", :notice => "Edit Permission updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @edit_permission = EditPermission.find(params[:id])

    @edit_permission.destroy

    redirect_to "/edit_permissions", :notice => "Edit Permission deleted."
  end
end
