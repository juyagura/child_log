class DiapersController < ApplicationController
  before_action(:set_diaper, :only => [:show, :edit, :update, :destroy])
  before_action(:signed_in_user_must_be_editor, :only => [:edit, :update, :destroy])

  def set_diaper
    @diaper = Diaper.find(params[:id])
  end

  def signed_in_user_must_be_editor
    unless @diaper.child.editing_users.include?(current_user)
      redirect_to root_url, :alert => "You do not have the permission for the action."
    end
  end


  def index
    @diapers = current_user.viewable_diapers.order("date desc, time desc")
  end

  def child_index
    @diapers = Child.find(params[:child_id]).diapers.order("date desc, time desc")
    render 'index'
  end

  def show
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
      redirect_to "/children/#{@diaper.child_id}/dayview/#{@diaper.date}", :notice => "Diaper created successfully."
    else
      render 'new'
    end
  end

  def edit
  end

  def update

    @diaper.category = params[:category]
    @diaper.description = params[:description]
    @diaper.date = params[:date]
    @diaper.time = params[:hour] + ":" + params[:minutes] + " " + params[:ampm]
    @diaper.child_id = params[:child_id]
    @diaper.user_id = params[:user_id]

    if @diaper.save
      redirect_to "/children/#{@diaper.child_id}/dayview/#{@diaper.date}", :notice => "Diaper updated successfully."
    else
      render 'edit'
    end
  end

  def destroy

    @diaper.destroy

    redirect_to :back, :notice => "Diaper deleted."
  end
end
