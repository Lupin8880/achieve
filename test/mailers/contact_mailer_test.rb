require 'test_helper'

class ContactMailerTest < ActionMailer::TestCase
  test "sencontact_blog" do
    mail = ContactMailer.sencontact_blog
    assert_equal "Sencontact blog", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
