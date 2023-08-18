class BookingMailer < ApplicationMailer
  def send_mail(booking)
    @booking = booking

    mail to: @booking.contact_id, subject: @booking.title
  end
end
