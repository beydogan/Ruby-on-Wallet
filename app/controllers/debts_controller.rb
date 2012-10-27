class DebtsController < ApplicationController
  def index
    @debts = Debt.all
  end
  
  def new
    @debt = Debt.new
  end
  
  def create
    @debt = Debt.new(params[:debt])
    if !@debt.amount.blank?
      @person = Person.find(@debt.person_id)
      @person.update_attribute("debt", @person.debt + @debt.amount)   
    end
    if @debt.save
      redirect_to(debts_path ,
        :notice => "Debt Added!")
    else
      redirect_to(new_debt_path ,
        :notice => "Sorry, an error occured! Check input fields")
    end  
  end
  
  def markaspaid
    @debt = Debt.find(params[:id])
    @debt.update_attribute(:status, 1)   
    @person = Person.find(@debt.person_id)
    @person.update_attribute("debt", @person.debt - @debt.amount)   
    redirect_to(debts_path)
  end
 
end
