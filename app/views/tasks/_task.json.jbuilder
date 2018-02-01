json.id "#{task.id}"
json.(task, :title, :memo, :priority)
json.start_from "#{task.start_from_date.to_s(:date_hyphen)} #{task.start_from_time.to_s(:time)}"
json.deadline "#{task.deadline_date.to_s(:date_hyphen)} #{task.deadline_time.to_s(:time)}"
json.(task, :created_at, :updated_at)
