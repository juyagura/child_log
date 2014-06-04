class ChildrenController < ApplicationController
  def index
    @children = current_user.viewable_children
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
      o = OwnPermission.new
      o.user_id = current_user.id
      o.child_id = @child.id
      o.save

      e = EditPermission.new
      e.user_id = current_user.id
      e.child_id = @child.id
      e.save

      v = ViewPermission.new
      v.user_id = current_user.id
      v.child_id = @child.id
      v.save

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
