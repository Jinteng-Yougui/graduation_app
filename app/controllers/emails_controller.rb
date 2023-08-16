class EmailsController < ApplicationController
  before_action :set_email, only: %i[ show edit update destroy ]

  ---省略---

  # メール内容の作成
  def create
    @email = Email.new(email_params)

    respond_to do |format|
      if @email.save

        # メール作成時にメール送信処理のJobを実行
        SendEmailJob.set(wait_until: @email.sent_at).perform_later(@email)

        format.html { redirect_to email_url(@email), notice: "Email was successfully created." }
        format.json { render :show, status: :created, location: @email }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @email.errors, status: :unprocessable_entity }
      end
    end
  end

  # メール内容の更新
  def update
    respond_to do |format|
      if @email.update(email_params)

        # メール更新時にメール送信処理のJobを実行
        SendEmailJob.set(wait_until: @email.sent_at).perform_later(@email)
        
        format.html { redirect_to email_url(@email), notice: "Email was successfully updated." }
        format.json { render :show, status: :ok, location: @email }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @email.errors, status: :unprocessable_entity }
      end
    end
  end

  ----省略---

  private
    def set_email
      @email = Email.find(params[:id])
    end

    def email_params
      params.require(:email).permit(:to, :from, :subject, :body, :sent_at)
    end
end