class BookingMailer < ApplicationMailer
  def send_mail(booking)
    @booking = booking

    mail from: booking.contact.user.email, to: @booking.contact.email, subject: @booking.title
  end
end
