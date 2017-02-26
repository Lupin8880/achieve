class ContactMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contact_mailer.sencontact_blog.subject
  #
  def send_mail_to_manager(contact)
    @contact = contact
    mail to: "t-da@suou.waseda.jp",subject:'問い合わせがきました'
  end
  
  
  def send_mail_to_user(contact)
    @contact = contact
    mail to: @contact.email,subject:'問い合わせが完了しました'
  end
end
