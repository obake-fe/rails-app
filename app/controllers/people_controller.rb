class PeopleController < ApplicationController
  def index
    @msg = "Person data."
    @data = Person.all
  end

  def show
    @msg = "Person details."
    @person = Person.find(params[:id])
  end

  def add
    @msg = "Add a new person."
    @person = Person.new
  end

  def create
    @person = Person.new(person_params)
    if request.post? then
      Person.create(person_params)
    end
    redirect_to action: :index
  end

  # private

  def person_params
    params.require(:person).permit(:name, :age, :mail)
  end
end
