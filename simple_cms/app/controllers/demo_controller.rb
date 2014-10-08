class DemoController < ApplicationController

  layout 'application'

  def index
  end

  def hello
    @array = [1, 2, 3, 4, 5]
    @id = params[:id].to_i
    @page = params['page'].to_i
  end

  def other_hello
    redirect_to( :controller => 'demo', :action => 'hello')
  end

  def google
    redirect_to('http://www.google.com/')
  end

end
