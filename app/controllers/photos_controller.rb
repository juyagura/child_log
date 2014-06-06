class PhotosController < ApplicationController
  before_action(:set_photo, :only => [:show, :edit, :update, :destroy])
  before_action(:signed_in_user_must_be_editor, :only => [:edit, :update, :destroy])

  def set_photo
    @photo = Photo.find(params[:id])
  end

  def signed_in_user_must_be_editor
    unless @photo.child.editing_users.include?(current_user)
      redirect_to root_url, :alert => "You do not have the permission for the action."
    end
  end


  def index
    @photos = current_user.viewable_photos.order("date desc, id desc")
  end

  def child_index
    @photos = Child.find(params[:child_id]).photos.order("date desc, id desc")
    render 'index'
  end

  def show
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new
    @photo.image = params[:image]
    @photo.date = params[:date]
    @photo.caption = params[:caption]
    @photo.user_id = params[:user_id]
    @photo.child_id = params[:child_id]

    if @photo.save
      redirect_to "/children/#{@photo.child_id}/dayview/#{@photo.date}", :notice => "Photo created successfully."
    else
      render 'new'
    end
  end

  def edit
  end

  def update

    @photo.image = params[:image]
    @photo.date = params[:date]
    @photo.caption = params[:caption]
    @photo.user_id = params[:user_id]
    @photo.child_id = params[:child_id]

    if @photo.save
      redirect_to "/children/#{@photo.child_id}/dayview/#{@photo.date}", :notice => "Photo updated successfully."
    else
      render 'edit'
    end
  end

  def destroy

    @photo.destroy

    redirect_to :back, :notice => "Photo deleted."
  end
end
