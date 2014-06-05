class PhotosController < ApplicationController
  def index
    @photos = current_user.viewable_photos.order("date desc, id desc")
  end

  def child_index
    @photos = Child.find(params[:child_id]).photos.order("date desc, id desc")
    render 'index'
  end

  def show
    @photo = Photo.find(params[:id])
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
      redirect_to "/children/#{@photo.child_id}/#{@photo.date}", :notice => "Photo created successfully."
    else
      render 'new'
    end
  end

  def edit
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])

    @photo.image = params[:image]
    @photo.date = params[:date]
    @photo.caption = params[:caption]
    @photo.user_id = params[:user_id]
    @photo.child_id = params[:child_id]

    if @photo.save
      redirect_to "/children/#{@photo.child_id}/#{@photo.date}", :notice => "Photo updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @photo = Photo.find(params[:id])

    @photo.destroy

    redirect_to :back, :notice => "Photo deleted."
  end
end
