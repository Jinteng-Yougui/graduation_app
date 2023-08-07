class ContactsController < ApplicationController
before_action :set_contact, only:%i[ show edit update destroy]
before_action :forbid_login_user, {only: [:top]}
  def index
    @contacts = Contact.all
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def destroy
  @contact.destroy

    respond_to do |format|
      format.html { redirect_to contacts_url, notice: "連絡先が削除されました。" }
      format.json { head :no_content }  
    end
  end
end
