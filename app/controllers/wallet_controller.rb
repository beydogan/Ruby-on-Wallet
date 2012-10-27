class WalletController < ApplicationController
  def index
    @people = Person.all    
    @debts = getUpComingDebts
    @paidCount = Debt.where("status = ?",true).count
    @unpaidCount = Debt.where("status = ?",false).count
  end
  
  def getUpComingDebts
    debts = Debt.where("duedate between ? and ?", Date.today, (Date.today + 20)).order("duedate DESC").limit(50)
    return debts 
  end
end
