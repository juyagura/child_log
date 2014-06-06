class ChildrenController < ApplicationController
  before_action(:set_child, :only => [:show, :dayview, :edit, :update, :destroy])
  before_action(:signed_in_user_must_be_owner, :only => [:edit, :update, :destroy])

  def set_child
    @child = Child.find(params[:id])
  end

  def signed_in_user_must_be_owner
    unless @child.owning_users.include?(current_user)
      redirect_to root_url, :alert => "You do not have the permission for the action."
    end
  end

  def index
    @children = current_user.viewable_children
  end

  def show
  end

  def dayview
    @foods = @child.foods.where({ :date => params[:date] }).order("time desc")
    @sleeps = @child.sleeps.where({ :date => params[:date] }).order("time desc")
    @diapers = @child.diapers.where({ :date => params[:date] }).order("time desc")
    @baths = @child.baths.where({ :date => params[:date] }).order("time desc")
    @healths = @child.healths.where({ :date => params[:date] }).order("time desc")
    @accomplishments = @child.accomplishments.where({ :date => params[:date] }).order("time desc")
    @notes = @child.notes.where({ :date => params[:date] }).order("id desc")
    @photos = @child.photos.where({ :date => params[:date] }).order("id desc")

  end

  def datepick
    redirect_to "/children/#{params[:child_id]}/dayview/#{params[:date]}"

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
  end

  def update
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
    @child.destroy

    redirect_to :back, :notice => "Child deleted."
  end
end
