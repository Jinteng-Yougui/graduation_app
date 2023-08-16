class EmailMailer < ApplicationMailer
  def send_mail(email)
    @email = email

    mail(
      from: @user.email,
      to: @booking.contact.email,
      subject: @booking.title
    )
  end
end
