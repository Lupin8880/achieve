class ContactsController < ApplicationController
  def index
  end

  def new
    if params[:back]
      @contact = Contact.new(contacts_params)
    else
      @contact = Contact.new
    end
  end

  def create
    @contact = Contact.new(contacts_params)
    if @contact.save
      ContactMailer.send_mail_to_user(@contact.email).deliver
      ContactMailer.send_mail_to_manager.deliver
      redirect_to root_path, notice: "お問合わせが完了しました！"
      # NoticeMailer.sendmail_contact(@contact).deliver
    else
      render action: 'new'
    end
  end
  
  def confirm
    @contact = Contact.new(contacts_params)
    render :new if @contact.invalid?
  end
  
  # def create
  #   @contact = Contact.new(contacts_params)
  #   if @contact.save
  #     redirect_to contacts_path, notice: "お問合せを受け付けました！"
  #     NoticeMailer.sendmail_blog(@contact).deliver
  #   else
  #     render 'new'
  #   end
  # end
  
  private
    def contacts_params
      params.require(:contact).permit(:name, :email, :content)
    end
end
