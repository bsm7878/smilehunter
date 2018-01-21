class CreatePlatforms < ActiveRecord::Migration
  def change
    create_table :platforms do |t|

     t.string :platform #플랫폼_01.naver_02.youtube_03.kakao_04.facebook
     t.string :channel_name #채널이름_tv-people_mbc entertainment
     t.string :image_src #채널 사진
     t.string :channel_address #채널 주소


      t.timestamps null: falser
    end
  end
end
