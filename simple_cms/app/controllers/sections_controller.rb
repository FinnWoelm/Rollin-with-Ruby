class SectionsController < ApplicationController

  layout false
    
  def index
      @sections = Section.sorted
  end

  def show
      @section = Section.find(params[:id])
  end

  def new
    @section = Section.new
  end
    
  def create
    @section = Section.new(section_params)
      
    if @section.save
       # If save succeeds, redirect to index page
       flash[:notice] = "Section created successfully."
       redirect_to(:action => 'index')
    else
       # If update fails, redisplay the form so user can fix problems
       render('new')
    end      
  end

  def edit
    @section = Section.find(params[:id])
  end
    
  def update
    @section = Section.find(params[:id])
    
    if @section.update_attributes(section_params)
       # If update succeeds, redirect to show page
       flash[:notice] = "Section updated successfully."
       redirect_to(:action => 'show', :id => @section.id)
    else
       # If update fails, redisplay the form so user can fix problems
       render('edit')
    end             
  end

  def delete
    @section = Section.find(params[:id])
  end
    
  def destroy
    @section = Section.find(params[:id]).destroy
    flash[:notice] = "Section '#{@section.name}' destroyed successfully."
    redirect_to(:action => 'index')      
  end
      
  private
    def section_params
      # raises an error if subject is not set
      # and whitelists for mass-assignment
      params.require(:section).permit(:name, :position, :visible, :content_type, :content)
    end
      
end
