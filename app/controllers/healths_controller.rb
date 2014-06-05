class HealthsController < ApplicationController
  def index
    @healths = current_user.viewable_healths.order("date desc, time desc")
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
    @health.time = params[:hour] + ":" + params[:minutes] + " " + params[:ampm]
    @health.child_id = params[:child_id]
    @health.user_id = params[:user_id]

    if @health.save
      redirect_to "/children/#{@health.child_id}/#{@health.date}", :notice => "Health created successfully."
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
    @health.time = params[:hour] + ":" + params[:minutes] + " " + params[:ampm]
    @health.child_id = params[:child_id]
    @health.user_id = params[:user_id]

    if @health.save
      redirect_to "/children/#{@health.child_id}/#{@health.date}", :notice => "Health updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @health = Health.find(params[:id])

    @health.destroy

    redirect_to :back, :notice => "Health deleted."
  end
end
