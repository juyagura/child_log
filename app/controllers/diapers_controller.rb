class DiapersController < ApplicationController
  def index
    @diapers = current_user.viewable_diapers.order("date desc, time desc")
  end

  def child_index
    @diapers = Child.find(params[:child_id]).diapers.order("date desc, time desc")
    render 'index'
  end

  def show
    @diaper = Diaper.find(params[:id])
  end

  def new
    @diaper = Diaper.new
  end

  def create
    @diaper = Diaper.new
    @diaper.category = params[:category]
    @diaper.description = params[:description]
    @diaper.date = params[:date]
    @diaper.time = params[:hour] + ":" + params[:minutes] + " " + params[:ampm]
    @diaper.child_id = params[:child_id]
    @diaper.user_id = params[:user_id]

    if @diaper.save
      redirect_to "/children/#{@diaper.child_id}/#{@diaper.date}", :notice => "Diaper created successfully."
    else
      render 'new'
    end
  end

  def edit
    @diaper = Diaper.find(params[:id])
  end

  def update
    @diaper = Diaper.find(params[:id])

    @diaper.category = params[:category]
    @diaper.description = params[:description]
    @diaper.date = params[:date]
    @diaper.time = params[:hour] + ":" + params[:minutes] + " " + params[:ampm]
    @diaper.child_id = params[:child_id]
    @diaper.user_id = params[:user_id]

    if @diaper.save
      redirect_to "/children/#{@diaper.child_id}/#{@diaper.date}", :notice => "Diaper updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @diaper = Diaper.find(params[:id])

    @diaper.destroy

    redirect_to :back, :notice => "Diaper deleted."
  end
end
