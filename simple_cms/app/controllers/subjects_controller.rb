class SubjectsController < ApplicationController

  layout false

  def index
    @subjects = Subject.sorted
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def new
    @subject = Subject.new
  end

  def create
    # Instantiate a new object using the form parameters
    
    @subject =  Subject.new(subject_params)
    # Save the object
    if @subject.save
       # If save succeeds, redirect to index
       redirect_to(:action => 'index')
    else
       # If save fails, redisplay the form so user can fix problems
       render('new')
    end
  end

  def edit
  end

  def delete
  end

  private

    def subject_params
      # raises an error if subject is not set
      # and whitelists for mass-assignment
      params.require(:subject).permit(:name, :position, :visible)
    end

end
