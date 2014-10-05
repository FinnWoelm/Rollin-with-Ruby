class PagesController < ApplicationController

  layout "admin"
    
  def index
    @pages = Page.sorted
  end

  def show
    @page = Page.find(params[:id])
  end

  def new
    @page = Page.new
  end
    
  def create
    @page = Page.new(page_params)
      
    if @page.save
       # If create succeeds, redirect to index
       flash[:notice] = "Page created successfully."
       redirect_to(:action => 'index')
    else
       # If create fails, redisplay the form so user can fix problems
       render('new')
    end                
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(page_params)
       # If update succeeds, redirect to show page
       flash[:notice] = "Page updated successfully."
       redirect_to(:action => 'show', :id => @page.id)
    else
       # If update fails, redisplay the form so user can fix problems
       render('edit')
    end        
  end
    
  def delete
    @page = Page.find(params[:id])
  end
    
  def destroy
    @page = Page.find(params[:id]).destroy
    flash[:notice] = "Page '#{@page.name}' destroyed successfully."
    redirect_to(:action => 'index')
  end
    
  private
    def page_params
      # raises an error if subject is not set
      # and whitelists for mass-assignment
      params.require(:page).permit(:name, :position, :permalink, :visible)
    end   
    
end
