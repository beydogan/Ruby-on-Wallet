class Debt < ActiveRecord::Base
  before_save :init
  belongs_to :person
  attr_accessible :amount, :duedate, :person_id, :status
  validates :duedate, :presence => true
  validates :amount, :numericality => true,:presence => true  
  validates :person_id, :numericality => true,:presence => true
  
  def init
    if self.status.nil?
      self.status = 0
    end
  end
end
