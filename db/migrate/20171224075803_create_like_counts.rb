class CreateLikeCounts < ActiveRecord::Migration
  def change
    create_table :like_counts do |t|

     

      t.timestamps null: false
    end
  end
end
