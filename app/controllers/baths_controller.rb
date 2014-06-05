class BathsController < ApplicationController
  def index
    @baths = Bath.all
  end

  def show
    @bath = Bath.find(params[:id])
  end

  def new
    @bath = Bath.new
  end

  def create
    @bath = Bath.new
    @bath.date = params[:date]
    @bath.time = params[:hour] + ":" + params[:minutes] + " " + params[:ampm]
    @bath.child_id = params[:child_id]
    @bath.user_id = params[:user_id]

    if @bath.save
      redirect_to "/children/#{@bath.child_id}/#{@bath.date}", :notice => "Bath created successfully."
    else
      render 'new'
    end
  end

  def edit
    @bath = Bath.find(params[:id])
  end

  def update
    @bath = Bath.find(params[:id])

    @bath.date = params[:date]
    @bath.time = params[:hour] + ":" + params[:minutes] + " " + params[:ampm]
    @bath.child_id = params[:child_id]
    @bath.user_id = params[:user_id]

    if @bath.save
      redirect_to "/children/#{@bath.child_id}/#{@bath.date}", :notice => "Bath updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @bath = Bath.find(params[:id])

    @bath.destroy

    redirect_to :back, :notice => "Bath deleted."
  end
end
