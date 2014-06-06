class BathsController < ApplicationController
  before_action(:set_bath, :only => [:show, :edit, :update, :destroy])
  before_action(:signed_in_user_must_be_editor, :only => [:edit, :update, :destroy])

  def set_bath
    @bath = Bath.find(params[:id])
  end

  def signed_in_user_must_be_editor
    unless @bath.child.editing_users.include?(current_user)
      redirect_to root_url, :alert => "You do not have the permission for the action."
    end
  end


  def index
    @baths = current_user.viewable_baths.order("date desc, time desc")
  end

  def child_index
    @baths = Child.find(params[:child_id]).baths.order("date desc, time desc")
    render 'index'
  end

  def show
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
      redirect_to "/children/#{@bath.child_id}/dayview/#{@bath.date}", :notice => "Bath created successfully."
    else
      render 'new'
    end
  end

  def edit
  end

  def update

    @bath.date = params[:date]
    @bath.time = params[:hour] + ":" + params[:minutes] + " " + params[:ampm]
    @bath.child_id = params[:child_id]
    @bath.user_id = params[:user_id]

    if @bath.save
      redirect_to "/children/#{@bath.child_id}/dayview/#{@bath.date}", :notice => "Bath updated successfully."
    else
      render 'edit'
    end
  end

  def destroy

    @bath.destroy

    redirect_to :back, :notice => "Bath deleted."
  end
end
