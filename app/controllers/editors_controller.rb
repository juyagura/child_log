class EditorsController < ApplicationController
  def index
    @editors = Editor.all
  end

  def show
    @editor = Editor.find(params[:id])
  end

  def new
    @editor = Editor.new
  end

  def create
    @editor = Editor.new
    @editor.child_id = params[:child_id]
    @editor.user_id = params[:user_id]

    if @editor.save
      redirect_to "/editors", :notice => "Editor created successfully."
    else
      render 'new'
    end
  end

  def edit
    @editor = Editor.find(params[:id])
  end

  def update
    @editor = Editor.find(params[:id])

    @editor.child_id = params[:child_id]
    @editor.user_id = params[:user_id]

    if @editor.save
      redirect_to "/editors", :notice => "Editor updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @editor = Editor.find(params[:id])

    @editor.destroy

    redirect_to "/editors", :notice => "Editor deleted."
  end
end
