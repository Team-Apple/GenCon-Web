# json.extract! event, :id, :title, :start_at_date, :start_at_time, :end_at_date, :end_at_time, :memo, :priority, :created_at, :updated_at
# json.url event_url(event, format: :json)

json.array!(@events) do |ev|
  json.(ev, :id, :title, :memo, :priority)
  json.start_at "#{ev.start_at_date.to_s(:date_hyphen)} #{ev.start_at_time.to_s(:time)}"
  json.end_at "#{ev.end_at_date.to_s(:date_hyphen)} #{ev.end_at_time.to_s(:time)}"
  json.(ev, :created_at, :updated_at)
end
