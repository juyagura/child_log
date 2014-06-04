class HealthsController < ApplicationController
  def index
    @healths = Health.all
  end

  def show
    @health = Health.find(params[:id])
  end

  def new
    @health = Health.new
  end

  def create
    @health = Health.new
    @health.description = params[:description]
    @health.date = params[:date]
    @health.time = params[:time]
    @health.child_id = params[:child_id]
    @health.user_id = params[:user_id]

    if @health.save
      redirect_to "/healths", :notice => "Health created successfully."
    else
      render 'new'
    end
  end

  def edit
    @health = Health.find(params[:id])
  end

  def update
    @health = Health.find(params[:id])

    @health.description = params[:description]
    @health.date = params[:date]
    @health.time = params[:time]
    @health.child_id = params[:child_id]
    @health.user_id = params[:user_id]

    if @health.save
      redirect_to "/healths", :notice => "Health updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @health = Health.find(params[:id])

    @health.destroy

    redirect_to "/healths", :notice => "Health deleted."
  end
end
