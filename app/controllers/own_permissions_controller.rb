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
    @own_permission.user_id = params[:user_id]

    if @own_permission.save
      redirect_to "/own_permissions", :notice => "Own Permission created successfully."
    else
      render 'new'
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
      redirect_to "/own_permissions", :notice => "Own Permission updated successfully."
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
