class CreateSubcontents < ActiveRecord::Migration
  def change
    create_table :subcontents do |t|

      #비어있음

      t.timestamps null: false
    end
  end
end
