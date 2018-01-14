class CreateMypages < ActiveRecord::Migration
  def change
    create_table :mypages do |t|

      t.integer :user_id
      t.integer :content_id

      t.timestamps null: false
    end
  end
end
