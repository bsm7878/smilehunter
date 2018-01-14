class CreateNicknames < ActiveRecord::Migration
  def change
    create_table :nicknames do |t|

      t.string :full_nickname

      t.timestamps null: false
    end
  end
end
