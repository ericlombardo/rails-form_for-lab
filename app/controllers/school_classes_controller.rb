class SchoolClassesController < ApplicationController
  def new
  end

  def create
    school_class = SchoolClass.new(params.require(:school_class).permit(:title, :room_number))  # create new instance with strong params
    school_class.save # persist to the database 
    redirect_to school_class_path(school_class) # redirect to show page for that school class 
  end

  def show
    @class = SchoolClass.find_by_id(params[:id])  # get class for show page
  end

  def edit
    @class = SchoolClass.find_by_id(params[:id])  # get class to fill out form_for values
  end

  def update
    @class = SchoolClass.find_by_id(params[:id])  # find instance of class
    @class.update(params.require(:school_class).permit(:title, :room_number)) # update it with strong params
    redirect_to school_class_path(@class) # redirect to school class instance view
  end
end
