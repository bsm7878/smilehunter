class HomeController < ApplicationController
    before_action :authenticate_user!, :except => [:index, :service, :intro]
  
  def index 
  
    @all = Content.where(:tv_type =>0).all.order('like_count DESC').limit(10) #인기 있는 예능 상위 10개 가져오기
    @all_comment = Comment.all #댓글 모두 가져오기
    @nick = Nickname.all #삭제

  end
  
  def search #최신 검색결과
    @tag = params[:tag] #태그 내용 받아옴
    #search_result2 = Content.where(:tag_01 => @tag) | Content.where(:tag_02 => @tag) | Content.where(:tag_03 => @tag) | Content.where(:tag_04 => @tag)
    #@search_result = search_result2.paginate(:page => params[:page], :per_page => 10)
    @search_result = Content.where("tag_01 = ? or tag_02 = ? or tag_03 = ? or tag_04 = ?", @tag, @tag, @tag, @tag).paginate(:page => params[:page], :per_page => 10)

    @serarch_rusult_count = Content.where(:tag_01 => @tag) | Content.where(:tag_02 => @tag) | Content.where(:tag_03 => @tag) | Content.where(:tag_04 => @tag)
    @all_comment = Comment.all #댓글 모두 가져오기
  end
  
  def search_ago #예전 검색 결과
    @tag = params[:tag] #태그 내용 받아옴
    #@search_result = Content.where(:tag_01 => @tag) | Content.where(:tag_02 => @tag) | Content.where(:tag_03 => @tag) | Content.where(:tag_04 => @tag)
    @search_result = Content.where("tag_01 = ? or tag_02 = ? or tag_03 = ? or tag_04 = ?", @tag, @tag, @tag, @tag).paginate(:page => params[:page], :per_page => 10)

    @serarch_rusult_count = Content.where(:tag_01 => @tag) | Content.where(:tag_02 => @tag) | Content.where(:tag_03 => @tag) | Content.where(:tag_04 => @tag)
    @all_comment = Comment.all #댓글 모두 가져오기
  end
  
  
  def person_cloud #개인 클라우드
   @all = Content.where(:id => Mypage.select(:content_id).where(:user_id => current_user.id)).paginate(:page => params[:page], :per_page => 10) 
   @count_mypage = Mypage.where(:user_id => current_user.id).all.count
   @count_like = Like.where(:user_id => current_user.id).all.count
  end
  
  
  def tv_show #예능_인기_보여주는 곳
    @all = Content.where(:tv_type =>0).all.order('like_count DESC').paginate(:page => params[:page], :per_page => 10) #인기_예능_가져오기
    @all_comment = Comment.all #댓글 모두 가져오기
  end
  
  def web_drama #웹컨텐츠_인기_보여주는 곳
    @all = Content.where(:tv_type =>1).all.order('like_count DESC').paginate(:page => params[:page], :per_page => 10) #인기_웹컨텐츠_가져오기
    @all_comment = Comment.all #댓글 모두 가져오기
    
  end
  
  
  
  def tv_new #예능_최신_보여주는 곳
     @all = Content.where(:tv_type =>0).all.paginate(:page => params[:page], :per_page => 10).order('created_at DESC') #최신_예능_가져오기
     @all_comment = Comment.all #댓글 모두 가져오기
  end
  
  def web_new #웹컨텐츠_최신_보여주는 곳
    @all = Content.where(:tv_type =>1).all.paginate(:page => params[:page], :per_page => 10).order('created_at DESC') #최신_웹컨텐츠_가져오기
    @all_comment = Comment.all #댓글 모두 가져오기
  end
  
  def tv_random #예능_무작위_보여주는 곳
    @all = Content.where(:tv_type =>0).all.paginate(:page => params[:page], :per_page => 10) #무작위_예능_가져오기
    @all_comment = Comment.all #댓글 모두 가져오기
  end
  
  def web_random #웹컨텐츠_무작위_보여주는 곳
    @all = Content.where(:tv_type => 1).all.paginate(:page => params[:page], :per_page => 10) #무작위_웹컨텐츠_가져오기
    @all_comment = Comment.all #댓글 모두 가져오기
  end
  
  def like_rank #컨텐츠 좋아요 갯수 변경
    
    
    Like.group(:content_id).all.count.each do |a, b|
      like_adjust = Content.find(a)
      like_adjust.like_count = b
      like_adjust.save
    end
    redirect_to :back
    
    
    

  end
  
  def comment_content_save #댓글 저장 페이지
  comment= Comment.new
  comment.content_id = params[:content2]
  comment.user_id = current_user.id
  comment.comment_content =  params[:content3]
  comment.save
  redirect_to :back
  
  end
  
 
  
  def video_show #컨텐츠 보여주는 곳 
    
  end
    
  
  def show
    
  end
  

  
  def admin_page #컨텐츠 form
  
  if current_user.email == "bsm7878@naver.com"
     @all_platform = Platform.all
  else
     redirect_to '/'
  end
  
  
  end
  
  def platform_save #플랫폼 저장 페이지
  plat = Platform.new
  plat.platform = params[:platform]
  plat.channel_name = params[:channel_name]
  plat.image_src = params[:image_src]
  plat.channel_address = params[:channel_address]
  plat.save
  redirect_to :back
    
  end
  
  
  def like_save #좋아요 저장 페이지
  
  if Like.where(:user_id => current_user.id).where(:content_id => params[:content].to_i).exists?
    like_delete = Like.where(:user_id => current_user.id).where(:content_id => params[:content].to_i).take
    like_delete.destroy
    redirect_to :back
  else
    like = Like.new
    like.content_id =params[:content].to_i
    like.user_id = current_user.id
    like.save
    redirect_to :back
  end
    
      
  end
  
  def mypage_save #본인 계정 컨텐츠 저장 페이지
  
  if Mypage.where(:user_id => current_user.id).where(:content_id => params[:content1].to_i).exists?
    mypage_delete = Mypage.where(:user_id => current_user.id).where(:content_id => params[:content1].to_i).take
    mypage_delete.destroy
    redirect_to :back
  else
    mypage = Mypage.new
    mypage.user_id = current_user.id
    mypage.content_id = params[:content1].to_i
    mypage.save
    redirect_to :back
  end
    
    
  end
  
  
  def admin_save #컨텐츠 저장 페이지
    add = Content.new
    add.platform_id =params[:platform].to_i
    add.tv_type = params[:tv_type].to_i
    add.source_address = params[:source_address]
    add.tv_title = params[:tv_title]
    add.tv_explanation = params[:tv_explanation]
    add.tag_01 = params[:tag_01]
    add.tag_02 = params[:tag_02]
    add.tag_03 = params[:tag_03]
    add.tag_04 = params[:tag_04]
    add.like_count = 0
    add.save
    redirect_to :back
  end
  
  def nickname_save #닉네임 저장 페이지
  
    xlsx = Roo::Excelx.new(Rails.root.join('app', 'assets',  'nick.xlsx'))
     #시작행
    
    i = 4
    while i < 124
      s = 4
      while s < 111
      
      nick = Nickname.new
      nick.full_nickname = xlsx.cell(i,3) + " " + xlsx.cell(s,4)
      nick.save
      s += 1
      end
      
      i += 1
    end
    
    redirect_to :back
  
  
  end
  
  
  def service
    
  end
  
  def intro
    
  end
  
  def user_bye #회원탈퇴 화면
    
  end
  
  def user_bye_save #회원탈퇴 저장 화면
    if current_user.valid_password?(params[:bye])
      user_delete = User.find(current_user.id)
      user_delete.destroy
      redirect_to '/'
    else
      redirect_to :back
    end
  end
  
  def email_send
    send_user = params[:send_user]
    send_content = params[:send_content]
    Mailpost.fly_email(send_user, send_content).deliver_now
    redirect_to :back
  end
  
  
  
end
