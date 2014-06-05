class NotesController < ApplicationController
  def index
    @notes = current_user.viewable_notes.order("date desc")
  end

  def child_index
    @notes = Child.find(params[:child_id]).notes.order("date desc")
    render 'index'
  end

  def show
    @note = Note.find(params[:id])
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
      redirect_to "/children/#{@note.child_id}/#{@note.date}", :notice => "Note created successfully."
    else
      render 'new'
    end
  end

  def edit
    @note = Note.find(params[:id])
  end

  def update
    @note = Note.find(params[:id])

    @note.content = params[:content]
    @note.date = params[:date]
    @note.child_id = params[:child_id]
    @note.user_id = params[:user_id]

    if @note.save
      redirect_to "/children/#{@note.child_id}/#{@note.date}", :notice => "Note updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @note = Note.find(params[:id])

    @note.destroy

    redirect_to :back, :notice => "Note deleted."
  end
end
