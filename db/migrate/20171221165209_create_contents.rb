class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      
      t.integer :platform_id #naver, kakao 등
      t.integer :tv_type # 0 => 예능, 1=> 웹컨켄츠
      t.string :source_address #영상 주소
      t.integer :like_count #like 카운트 
      t.string :tv_title #컨텐츠 제목
      t.string :tv_explanation #컨텐츠 설명
      t.string :tag_01 #tag_01
      t.string :tag_02 #tag_02
      t.string :tag_03 #tag_03
      t.string :tag_04 #tag_04
      t.timestamps null: false
    end
  end
end
