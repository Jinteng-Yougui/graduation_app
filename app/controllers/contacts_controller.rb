class ContactsController < ApplicationController
  def index
    @contacts = Contact.all
  end

  def edit
  end

  def destroy
  @contact.destroy

    respond_to do |format|
      format.html { redirect_to contacts_url, notice: "連絡先が削除されました。" }
      format.json { head :no_content }  
    end
  end
end
