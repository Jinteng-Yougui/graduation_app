class EmailSender
  def self.send_scheduled_email()
    Booking.all.each do |booking|
      if Time.now.to_date == booking.starting_time
        EmailMailer.send_mail(booking).deliver
      end
    end
  end
end
