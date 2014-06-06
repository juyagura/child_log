class AccomplishmentsController < ApplicationController
  before_action(:set_accomplishment, :only => [:show, :edit, :update, :destroy])
  before_action(:signed_in_user_must_be_editor, :only => [:edit, :update, :destroy])

  def set_accomplishment
    @accomplishment = Accomplishment.find(params[:id])
  end

  def signed_in_user_must_be_editor
    unless @accomplishment.child.editing_users.include?(current_user)
      redirect_to root_url, :alert => "You do not have the permission for the action."
    end
  end


  def index
    @accomplishments = current_user.viewable_accomplishments.order("date desc, time desc")
  end

  def child_index
    @accomplishments = Child.find(params[:child_id]).accomplishments.order("date desc, time desc")
    render 'index'
  end

  def show
  end

  def new
    @accomplishment = Accomplishment.new
  end

  def create
    @accomplishment = Accomplishment.new
    @accomplishment.description = params[:description]
    @accomplishment.date = params[:date]
    @accomplishment.time = params[:hour] + ":" + params[:minutes] + " " + params[:ampm]
    @accomplishment.child_id = params[:child_id]
    @accomplishment.user_id = params[:user_id]

    if @accomplishment.save
      redirect_to "/children/#{@accomplishment.child_id}/dayview/#{@accomplishment.date}", :notice => "Accomplishment created successfully."
    else
      render 'new'
    end
  end

  def edit
  end

  def update

    @accomplishment.description = params[:description]
    @accomplishment.date = params[:date]
    @accomplishment.time = params[:hour] + ":" + params[:minutes] + " " + params[:ampm]
    @accomplishment.child_id = params[:child_id]
    @accomplishment.user_id = params[:user_id]

    if @accomplishment.save
      redirect_to "/children/#{@accomplishment.child_id}/dayview/#{@accomplishment.date}", :notice => "Accomplishment updated successfully."
    else
      render 'edit'
    end
  end

  def destroy

    @accomplishment.destroy

    redirect_to :back, :notice => "Accomplishment deleted."
  end
end
