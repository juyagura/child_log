class SleepsController < ApplicationController
  def index
    @sleeps = current_user.viewable_sleeps.order("date desc, time desc")
  end

  def child_index
    @sleeps = Child.find(params[:child_id]).sleeps.order("date desc, time desc")
    render 'index'
  end

  def show
    @sleep = Sleep.find(params[:id])
  end

  def new
    @sleep = Sleep.new
  end

  def create
    @sleep = Sleep.new
    @sleep.category = params[:category]
    @sleep.date = params[:date]
    @sleep.time = params[:hour] + ":" + params[:minutes] + " " + params[:ampm]
    @sleep.duration_hours = params[:duration_hours]
    @sleep.child_id = params[:child_id]
    @sleep.user_id = params[:user_id]

    if @sleep.save
      redirect_to "/children/#{@sleep.child_id}/#{@sleep.date}", :notice => "Sleep created successfully."
    else
      render 'new'
    end
  end

  def edit
    @sleep = Sleep.find(params[:id])
  end

  def update
    @sleep = Sleep.find(params[:id])

    @sleep.category = params[:category]
    @sleep.date = params[:date]
    @sleep.time = params[:hour] + ":" + params[:minutes] + " " + params[:ampm]
    @sleep.duration_hours = params[:duration_hours]
    @sleep.child_id = params[:child_id]
    @sleep.user_id = params[:user_id]

    if @sleep.save
      redirect_to "/children/#{@sleep.child_id}/#{@sleep.date}", :notice => "Sleep updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @sleep = Sleep.find(params[:id])

    @sleep.destroy

    redirect_to :back, :notice => "Sleep deleted."
  end
end
