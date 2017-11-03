json.id "#{event.id}"
json.(event, :title, :memo, :priority)
json.start_at "#{event.start_at_date.to_s(:date_hyphen)} #{event.start_at_time.to_s(:time)}"
json.end_at "#{event.end_at_date.to_s(:date_hyphen)} #{event.end_at_time.to_s(:time)}"
json.(event, :created_at, :updated_at)
