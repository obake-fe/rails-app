class HelloController < ApplicationController
  @@contacts = []

  def initialize
    super
    @title = "ActiveModel Sample"
  end

  def index
    @contacts = @@contacts

    if request.post?
      @contact = Contact.new(contact_params)

      if @contact.valid?
        @message = "Contact saved successfully"
        @contacts << @contact
        redirect_to action: :index, title: @title, msg: @message
      else
        @message = "Contact is invalid: " + @contact.errors.full_messages.join(", ")
        render :index, status: :unprocessable_entity
      end
    else
      @contact = Contact.new()
      @message = params[:msg]? params[:msg] : "Welcome to the ActiveModel sample app!"
    end
  end

  def contact_params
    params.require(:contact).permit(:name, :email)
  end

  def other
    redirect_to action: :index, msg: "from other page"
  end
end
