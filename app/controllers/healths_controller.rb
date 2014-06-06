class HealthsController < ApplicationController
  before_action(:set_health, :only => [:show, :edit, :update, :destroy])
  before_action(:signed_in_user_must_be_editor, :only => [:edit, :update, :destroy])

  def set_health
    @health = Health.find(params[:id])
  end

  def signed_in_user_must_be_editor
    unless @health.child.editing_users.include?(current_user)
      redirect_to root_url, :alert => "You do not have the permission for the action."
    end
  end


  def index
    @healths = current_user.viewable_healths.order("date desc, time desc")
  end

  def child_index
    @healths = Child.find(params[:child_id]).healths.order("date desc, time desc")
    render 'index'
  end

  def show
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
      redirect_to "/children/#{@health.child_id}/dayview/#{@health.date}", :notice => "Health created successfully."
    else
      render 'new'
    end
  end

  def edit
  end

  def update

    @health.description = params[:description]
    @health.date = params[:date]
    @health.time = params[:hour] + ":" + params[:minutes] + " " + params[:ampm]
    @health.child_id = params[:child_id]
    @health.user_id = params[:user_id]

    if @health.save
      redirect_to "/children/#{@health.child_id}/dayview/#{@health.date}", :notice => "Health updated successfully."
    else
      render 'edit'
    end
  end

  def destroy

    @health.destroy

    redirect_to :back, :notice => "Health deleted."
  end
end
