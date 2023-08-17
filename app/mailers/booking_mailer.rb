class BookingMailer < ApplicationMailer
  def send_mail(booking)
    @booking = booking

    mail(
      from: booking.user.email,
      to: booking.contact.email,
      subject: booking.title,
      content: booking.content,
    )
  end
end
