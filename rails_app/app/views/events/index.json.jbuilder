json.array!(@events) do |event|
  json.extract! event, :id, :title, :description, :location, :event_date, :slot, :price
  json.url event_url(event, format: :json)
end
