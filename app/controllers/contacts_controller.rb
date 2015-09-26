class ContactsController < ApplicationController

  def create
    @contact = Contact.new(contact_params)

    if @contact.valid?
      ContactMailer.contact_message(contact_params).deliver
      redirect_to root_path
    else
      redirect_to root_path
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end

end