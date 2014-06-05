class FoodsController < ApplicationController
  def index
    @foods = Food.all
  end

  def show
    @food = Food.find(params[:id])
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new
    @food.category = params[:category]
    @food.description = params[:description]
    @food.date = params[:date]
    @food.time = params[:hour] + ":" + params[:minutes] + " " + params[:ampm]
    @food.child_id = params[:child_id]
    @food.user_id = params[:user_id]

    if @food.save
      redirect_to "/foods", :notice => "Food created successfully."
    else
      render 'new'
    end
  end

  def edit
    @food = Food.find(params[:id])
  end

  def update
    @food = Food.find(params[:id])

    @food.category = params[:category]
    @food.description = params[:description]
    @food.date = params[:date]
    @food.time = params[:hour] + ":" + params[:minutes] + " " + params[:ampm]
    @food.child_id = params[:child_id]
    @food.user_id = params[:user_id]

    if @food.save
      redirect_to "/foods", :notice => "Food updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @food = Food.find(params[:id])

    @food.destroy

    redirect_to "/foods", :notice => "Food deleted."
  end
end
