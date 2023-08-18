class ContactsController < ApplicationController
before_action :forbid_login_user, {only: [:top]}
before_action :set_q, only: [:index, :search]

  def index
    @contacts = current_user.contacts
    @user = current_user
    @contacts = @contacts.page(params[:page]).per(5)
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact= current_user.contacts.build(contact_params)
		if params[:back]
      render :new
	  else
		  if @contact.save
        flash[:notice] = "連絡先の登録が完了しました！"
        redirect_to contacts_path
		  else
       render :new
		  end
    end
  end

  def show 
    @contact = Contact.find(params[:id])
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def update
    @contact = Contact.find(params[:id])
    if @contact.update(contact_params)
      flash[:notice] = "編集しました。"
      redirect_to contacts_path
    else
      render :edit
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy

    respond_to do |format|
      format.html { redirect_to contacts_url, notice: "連絡先が削除されました。" }
      format.json { head :no_content }  
    end
  end

  def confirm
    @contact = current_user.contacts.build(contact_params)
    render :new if @contact.invalid?
  end

  def search
    @results = @q.result

    render :index
  end

  private

  def set_q
    @q = Contact.ransack(params[:q])
  end

  def contact_params
    params.require(:contact).permit(:name, :email)
  end

end
