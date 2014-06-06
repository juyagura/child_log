class SleepsController < ApplicationController
  before_action(:set_sleep, :only => [:show, :edit, :update, :destroy])
  before_action(:signed_in_user_must_be_editor, :only => [:edit, :update, :destroy])

  def set_sleep
    @sleep = Sleep.find(params[:id])
  end

  def signed_in_user_must_be_editor
    unless @sleep.child.editing_users.include?(current_user)
      redirect_to root_url, :alert => "You do not have the permission for the action."
    end
  end


  def index
    @sleeps = current_user.viewable_sleeps.order("date desc, time desc")
  end

  def child_index
    @sleeps = Child.find(params[:child_id]).sleeps.order("date desc, time desc")
    render 'index'
  end

  def show
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
      redirect_to "/children/#{@sleep.child_id}/dayview/#{@sleep.date}", :notice => "Sleep created successfully."
    else
      render 'new'
    end
  end

  def edit
  end

  def update

    @sleep.category = params[:category]
    @sleep.date = params[:date]
    @sleep.time = params[:hour] + ":" + params[:minutes] + " " + params[:ampm]
    @sleep.duration_hours = params[:duration_hours]
    @sleep.child_id = params[:child_id]
    @sleep.user_id = params[:user_id]

    if @sleep.save
      redirect_to "/children/#{@sleep.child_id}/dayview/#{@sleep.date}", :notice => "Sleep updated successfully."
    else
      render 'edit'
    end
  end

  def destroy

    @sleep.destroy

    redirect_to :back, :notice => "Sleep deleted."
  end
end
