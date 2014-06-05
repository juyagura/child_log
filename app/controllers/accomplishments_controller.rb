class AccomplishmentsController < ApplicationController
  def index
    @accomplishments = current_user.viewable_accomplishments.order("date desc, time desc")
  end

  def child_index
    @accomplishments = Child.find(params[:child_id]).accomplishments.order("date desc, time desc")
    render 'index'
  end

  def show
    @accomplishment = Accomplishment.find(params[:id])
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
      redirect_to "/children/#{@accomplishment.child_id}/#{@accomplishment.date}", :notice => "Accomplishment created successfully."
    else
      render 'new'
    end
  end

  def edit
    @accomplishment = Accomplishment.find(params[:id])
  end

  def update
    @accomplishment = Accomplishment.find(params[:id])

    @accomplishment.description = params[:description]
    @accomplishment.date = params[:date]
    @accomplishment.time = params[:hour] + ":" + params[:minutes] + " " + params[:ampm]
    @accomplishment.child_id = params[:child_id]
    @accomplishment.user_id = params[:user_id]

    if @accomplishment.save
      redirect_to "/children/#{@accomplishment.child_id}/#{@accomplishment.date}", :notice => "Accomplishment updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @accomplishment = Accomplishment.find(params[:id])

    @accomplishment.destroy

    redirect_to :back, :notice => "Accomplishment deleted."
  end
end
