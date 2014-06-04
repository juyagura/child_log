class ViewersController < ApplicationController
  def index
    @viewers = Viewer.all
  end

  def show
    @viewer = Viewer.find(params[:id])
  end

  def new
    @viewer = Viewer.new
  end

  def create
    @viewer = Viewer.new
    @viewer.child_id = params[:child_id]
    @viewer.user_id = params[:user_id]

    if @viewer.save
      redirect_to "/viewers", :notice => "Viewer created successfully."
    else
      render 'new'
    end
  end

  def edit
    @viewer = Viewer.find(params[:id])
  end

  def update
    @viewer = Viewer.find(params[:id])

    @viewer.child_id = params[:child_id]
    @viewer.user_id = params[:user_id]

    if @viewer.save
      redirect_to "/viewers", :notice => "Viewer updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @viewer = Viewer.find(params[:id])

    @viewer.destroy

    redirect_to "/viewers", :notice => "Viewer deleted."
  end
end
