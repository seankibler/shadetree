json.extract! vehicle, :id, :name, :type, :make_id, :model_id, :year, :vin, :miles, :color, :customer_id, :created_at, :updated_at
json.url vehicle_url(vehicle, format: :json)
