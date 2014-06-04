class ChildrenController < ApplicationController
  def index
    @children = Child.all
  end

  def show
    @child = Child.find(params[:id])
  end

  def new
    @child = Child.new
  end

  def create
    @child = Child.new
    @child.name = params[:name]
    @child.dob = params[:dob]
    @child.sex = params[:sex]

    if @child.save
      redirect_to "/children", :notice => "Child created successfully."
    else
      render 'new'
    end
  end

  def edit
    @child = Child.find(params[:id])
  end

  def update
    @child = Child.find(params[:id])

    @child.name = params[:name]
    @child.dob = params[:dob]
    @child.sex = params[:sex]

    if @child.save
      redirect_to "/children", :notice => "Child updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @child = Child.find(params[:id])

    @child.destroy

    redirect_to "/children", :notice => "Child deleted."
  end
end
