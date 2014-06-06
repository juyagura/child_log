class FoodsController < ApplicationController
  before_action(:set_food, :only => [:show, :edit, :update, :destroy])
  before_action(:signed_in_user_must_be_editor, :only => [:edit, :update, :destroy])

  def set_food
    @food = Food.find(params[:id])
  end

  def signed_in_user_must_be_editor
    unless @food.child.editing_users.include?(current_user)
      redirect_to root_url, :alert => "You do not have the permission for the action."
    end
  end


  def index
    @foods = current_user.viewable_foods.order("date desc, time desc")
  end

  def child_index
    @foods = Child.find(params[:child_id]).foods.order("date desc, time desc")
    render 'index'
  end

  def show
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
      redirect_to "/children/#{@food.child_id}/dayview/#{@food.date}", :notice => "Food created successfully."
    else
      render 'new'
    end
  end

  def edit
  end

  def update

    @food.category = params[:category]
    @food.description = params[:description]
    @food.date = params[:date]
    @food.time = params[:hour] + ":" + params[:minutes] + " " + params[:ampm]
    @food.child_id = params[:child_id]
    @food.user_id = params[:user_id]

    if @food.save
      redirect_to "/children/#{@food.child_id}/dayview/#{@food.date}", :notice => "Food updated successfully."
    else
      render 'edit'
    end
  end

  def destroy

    @food.destroy

    redirect_to :back, :notice => "Food deleted."
  end
end
