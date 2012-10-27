class CreateDebts < ActiveRecord::Migration
  def change
    create_table :debts do |t|
      t.integer :amount
      t.integer :person_id
      t.date :duedate
      t.boolean :status

      t.timestamps
    end
  end
end
