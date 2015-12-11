json.array!(@events) do |event|
  json.extract! event, :id, :title, :location, :start_date, :ends_date, :image, :description, :organizer_name, :event_type
  json.url event_url(event, format: :json)
end
