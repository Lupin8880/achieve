# Preview all emails at http://localhost:3000/rails/mailers/contact_mailer
class ContactMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/contact_mailer/sencontact_blog
  def sencontact_blog
    ContactMailer.sencontact_blog
  end

end
