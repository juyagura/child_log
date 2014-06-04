class ChildrenController < ApplicationController
  def index
    @children = current_user.viewable_children
  end

  def show
    @child = Child.find(params[:id])
  end

  def dayview
    @child = Child.find(params[:id])
    @foods = Food.where({ :child_id => params[:id], :date => params[:date] })
    @sleeps = Sleep.where({ :child_id => params[:id], :date => params[:date] })
    @diapers = Diaper.where({ :child_id => params[:id], :date => params[:date] })
    @baths = Bath.where({ :child_id => params[:id], :date => params[:date] })
    @healths = Health.where({ :child_id => params[:id], :date => params[:date] })
    @accomplishments = Accomplishment.where({ :child_id => params[:id], :date => params[:date] })
    @notes = Note.where({ :child_id => params[:id], :date => params[:date] })
    @photos = Photo.where({ :child_id => params[:id], :date => params[:date] })
  end

  def datepick
    redirect_to "/children/#{params[:child_id]}/#{params[:date]}"

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
