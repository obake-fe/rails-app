class HelloController < ApplicationController
  def index
    # @title = "Hello, World!"
    # @message = "This is a sample page."
    if params[:msg] != nil then
      @title = params[:msg]
    else
      @title = "Index"
    end
    @message = "This is a redirect sample page."
    #   @msg = params[:msg]
    # else
    #   @msg = "Hello, World!"
    # end
    # html = "<html><body><h1>#{@msg}</h1></body></html>"
    # render html: html.html_safe
  end

  def other
    redirect_to action: :index, msg: "from other page"
  end
end
