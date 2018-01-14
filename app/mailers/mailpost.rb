class Mailpost < ApplicationMailer
    
    def fly_email(content_1, content_2)
        mail from: content_1,
               to: 'bsm7878@naver.com', 
          subject: '웃음사냥꾼 문의',
             body: content_2
    end
    
end
