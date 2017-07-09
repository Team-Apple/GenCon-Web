class Event < ApplicationRecord
  enum repeat_unit: {days: 0, weeks: 1, months: 2, years: 3}
end
