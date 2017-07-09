json.extract! event, :id, :notif_at, :repeat, :repeat_value, :repeat_unit, :created_at, :updated_at
json.url event_url(event, format: :json)
