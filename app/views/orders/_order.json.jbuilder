json.extract! order, :id, :dispatcher_id, :driver_id, :status, :comment, :phone_number, :email, :AdresFrom, :AdresTo, :number_of_passengers, :date_of_trip, :created_at, :updated_at
json.url order_url(order, format: :json)
