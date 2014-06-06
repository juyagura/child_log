class NotesController < ApplicationController
  before_action(:set_note, :only => [:show, :edit, :update, :destroy])
  before_action(:signed_in_user_must_be_editor, :only => [:edit, :update, :destroy])

  def set_note
    @note = Note.find(params[:id])
  end

  def signed_in_user_must_be_editor
    unless @note.child.editing_users.include?(current_user)
      redirect_to root_url, :alert => "You do not have the permission for the action."
    end
  end


  def index
    @notes = current_user.viewable_notes.order("date desc")
  end

  def child_index
    @notes = Child.find(params[:child_id]).notes.order("date desc")
    render 'index'
  end

  def show
  end

  def new
    @note = Note.new
  end

  def create
    @note = Note.new
    @note.content = params[:content]
    @note.date = params[:date]
    @note.child_id = params[:child_id]
    @note.user_id = params[:user_id]

    if @note.save
      redirect_to "/children/#{@note.child_id}/dayview/#{@note.date}", :notice => "Note created successfully."
    else
      render 'new'
    end
  end

  def edit
  end

  def update

    @note.content = params[:content]
    @note.date = params[:date]
    @note.child_id = params[:child_id]
    @note.user_id = params[:user_id]

    if @note.save
      redirect_to "/children/#{@note.child_id}/dayview/#{@note.date}", :notice => "Note updated successfully."
    else
      render 'edit'
    end
  end

  def destroy

    @note.destroy

    redirect_to :back, :notice => "Note deleted."
  end
end
