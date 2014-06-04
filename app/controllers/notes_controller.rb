class NotesController < ApplicationController
  def index
    @notes = Note.all
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
      redirect_to "/notes", :notice => "Note created successfully."
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
      redirect_to "/notes", :notice => "Note updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @note = Note.find(params[:id])

    @note.destroy

    redirect_to "/notes", :notice => "Note deleted."
  end
end
