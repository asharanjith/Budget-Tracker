class CreateExpenses < ActiveRecord::Migration[7.0]
  def change
    create_table :expenses do |t|
      t.integer :author_id
      t.string :name
      t.float :amount

      t.timestamps
    end
  end
end
