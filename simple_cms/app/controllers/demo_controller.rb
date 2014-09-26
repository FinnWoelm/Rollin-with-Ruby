class DemoController < ApplicationController

  layout false

  def index
  end

  def hello
  end

  def other_hello
    redirect_to( :controller => 'demo', :action => 'hello')
  end

  def google
    redirect_to('http://www.google.com/')
  end

end
