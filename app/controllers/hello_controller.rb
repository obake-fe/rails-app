class HelloController < ApplicationController
  def index
    if request.post? then
      @title = "Hello, POST!"
      @message = "You submitted: #{params[:input1]}"
      @value = params[:input1]

      redirect_to action: :index, input1: params[:input1], title: "from POST", msg: "from POST"
    else
      @title = params[:title] || "Hello, GET!"
      @message =  params[:msg] || "This is a sample page."
      @value = params[:input1] || "default value"
    end
  end

  def other
    redirect_to action: :index, msg: "from other page"
  end
end
