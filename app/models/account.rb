class Account < ActiveRecord::Base
  validates :items_brought, presence: true
  validates :amount_spent, presence: true

end