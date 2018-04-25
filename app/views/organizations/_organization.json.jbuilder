json.extract! organization, :id, :org_name, :org_identifier, :first_name, :last_name, :addr_line1, :addr_line2, :city, :state, :country, :zipcode, :user_id, :created_at, :updated_at
json.url organization_url(organization, format: :json)
