class CreateAccounts < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts do |t|
    	t.string :items_brought
    	t.integer :amount_spent
    	t.integer :total
    	t.timestamps
    end
  end
end
