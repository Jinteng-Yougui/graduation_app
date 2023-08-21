json.extract! booking, :id, :title, :content, :date_on, :created_at, :updated_at
json.url booking_url(booking, format: :json)
