class PeopleController < ApplicationController
  def index
    @people = Person.all
    respond_to do |format|
      format.html
    end
  end
  
  def new
    @person = Person.new    
  end
  
  def create
    @person = Person.new(params[:person])      
    if @person.save
      redirect_to(people_path ,
        :notice => "Friend Added!")
    else
      redirect_to(new_person_path ,
        :notice => "Sorry, an error occured! Check input fields")
    end  
  end
  
  def show
    @person = Person.find(params[:id])    
  end
  
  def delete
    @person = Person.find(params[:id])
    @person.destroy
  end
  
  def getstatus
    @person = Person.find(params[:id])
    respond_to do |format|
      format.html
      format.json { render json: @person }
    end
  end
  
  def destroy
    @person = Person.find(params[:id])
    respond_to do |format|
      if @person.debt > 0
        format.html { redirect_to(people_path ,
        :notice => "Friend Can't Be Deleted Because He/She Has Unpayed Debts!")}
        format.js
      else        
        format.html { redirect_to(people_path ,
        :notice => "Friend Deleted")}
        format.js
      end
    end
  end
end
