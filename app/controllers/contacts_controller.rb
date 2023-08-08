class ContactsController < ApplicationController
before_action :set_contact, only:%i[ show edit update destroy]
before_action :forbid_login_user, {only: [:top]}
before_action :set_q, only: [:index, :search]
  def index
    @contacts = Contact.all
    @user = current_user
  end

  def new
    @contact = Contact.new
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

  def search
    @results = @q.result
  end

  private

  def set_q
    @q = Contact.ransack(params[:q])
  end

end
