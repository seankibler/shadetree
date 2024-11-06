json.extract! customer, :id, :first_name, :last_name, :phone_number, :street1, :street2, :city, :state, :postal_code, :created_at, :updated_at
json.url customer_url(customer, format: :json)
