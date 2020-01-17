class CreateBounties < ActiveRecord::Migration[5.2]

  def change
    create_table :bounties do |t|
      t.integer :user_id #null
      t.integer :district_id
      t.string :offense
      t.string :classification
      t.float :code
      t.float :value
      t.boolean :completed

      t.timestamps
    end
  end
end
