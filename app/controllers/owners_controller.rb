class OwnersController < ApplicationController
  def index
    @owners = Owner.all
  end

  def show
    @owner = Owner.find(params[:id])
  end

  def new
    @owner = Owner.new
  end

  def create
    @owner = Owner.new
    @owner.child_id = params[:child_id]
    @owner.user_id = params[:user_id]

    if @owner.save
      redirect_to "/owners", :notice => "Owner created successfully."
    else
      render 'new'
    end
  end

  def edit
    @owner = Owner.find(params[:id])
  end

  def update
    @owner = Owner.find(params[:id])

    @owner.child_id = params[:child_id]
    @owner.user_id = params[:user_id]

    if @owner.save
      redirect_to "/owners", :notice => "Owner updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @owner = Owner.find(params[:id])

    @owner.destroy

    redirect_to "/owners", :notice => "Owner deleted."
  end
end
