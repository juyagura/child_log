class PhotoCommentsController < ApplicationController
  def index
    @photo_comments = PhotoComment.all
  end

  def show
    @photo_comment = PhotoComment.find(params[:id])
  end

  def new
    @photo_comment = PhotoComment.new
  end

  def create
    @photo_comment = PhotoComment.new
    @photo_comment.content = params[:content]
    @photo_comment.photo_id = params[:photo_id]
    @photo_comment.user_id = params[:user_id]

    if @photo_comment.save
      redirect_to "/photo_comments", :notice => "Photo comment created successfully."
    else
      render 'new'
    end
  end

  def edit
    @photo_comment = PhotoComment.find(params[:id])
  end

  def update
    @photo_comment = PhotoComment.find(params[:id])

    @photo_comment.content = params[:content]
    @photo_comment.photo_id = params[:photo_id]
    @photo_comment.user_id = params[:user_id]

    if @photo_comment.save
      redirect_to "/photo_comments", :notice => "Photo comment updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @photo_comment = PhotoComment.find(params[:id])

    @photo_comment.destroy

    redirect_to "/photo_comments", :notice => "Photo comment deleted."
  end
end
