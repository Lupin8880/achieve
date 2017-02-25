class NoticeMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.sendmail_blog.subject
  #
  def sendmail_blog(blog)
    @blog = blog

    mail to: "sidney.tda1@gmail.com",
             subject:'【Achieve】ブログが投稿されました'
  end
  
  def send_mail_to_manager
    mail to: "t-da@suou.waseda.jp",subject:'問い合わせがきました'
  end
end