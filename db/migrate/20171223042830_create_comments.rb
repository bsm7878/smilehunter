class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|


      t.integer :content_id #content id
      t.integer :user_id #user_id
      t.string :comment_content #댓글내용
      
      t.timestamps null: false
    end
  end
end
