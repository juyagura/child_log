class PhotoCommentsController < ApplicationController
  before_action(:set_photo_comment, :only => [:show, :edit, :update, :destroy])
  before_action(:signed_in_user_must_be_comment_owner, :only => [:edit, :update, :destroy])

  def set_edit_permission
    @photo_comment = PhotoComment.find(params[:id])
  end

  def signed_in_user_must_be_comment_owner
    unless @photo_comment.user_id == current_user.id
      redirect_to root_url, :alert => "You do not have the permission for the action."
    end
  end


  def index
    @photo_comments = current_user.viewable_photo_comments.order("id desc")
  end

  def show
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
      redirect_to :back, :notice => "Photo comment created successfully."
    else
      render 'new'
    end
  end

  def edit
  end

  def update

    @photo_comment.content = params[:content]
    @photo_comment.photo_id = params[:photo_id]
    @photo_comment.user_id = params[:user_id]

    if @photo_comment.save
      redirect_to :back, :notice => "Photo comment updated successfully."
    else
      render 'edit'
    end
  end

  def destroy

    @photo_comment.destroy

    redirect_to :back, :notice => "Photo comment deleted."
  end
end
