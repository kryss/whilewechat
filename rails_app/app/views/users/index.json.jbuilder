json.array!(@users) do |user|
  json.extract! user, :id, :fullname, :company, :email, :school, :grade, :city, :country, :phone, :about
  json.url user_url(user, format: :json)
end
