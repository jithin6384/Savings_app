class Account < ActiveRecord::Base
  belongs_to :user
  validates :items_brought, presence: true
  validates :amount_spent, presence: true
  validates :user_id, presence: true
  
end