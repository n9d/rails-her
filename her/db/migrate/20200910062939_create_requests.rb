class CreateRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :requests do |t|
      t.integer :form_id
      t.integer :user_id
      t.string :before
      t.string :after

      t.timestamps
    end
  end
end
