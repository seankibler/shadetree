json.extract! service, :id, :name, :description, :type, :interval_miles, :interval_days, :created_at, :updated_at
json.url service_url(service, format: :json)
