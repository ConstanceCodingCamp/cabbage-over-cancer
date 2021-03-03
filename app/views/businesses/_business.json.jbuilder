json.extract! business, :id, :business_name, :website, :social_media, :email, :created_at, :updated_at
json.url business_url(business, format: :json)
