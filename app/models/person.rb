class Person < ActiveRecord::Base
  before_save :init
  has_many :debts, :dependent => :destroy
  attr_accessible :name, :email, :debt
  validates :name, :length => { :minimum => 5 }, :presence => true
  validates :email, :presence => true, :uniqueness => true
  validates_format_of :email, :with => /^(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})$/i

  def init
    if self.debt.nil?
      self.debt = 0
    end
  end
end
