class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def priority_color
    case priority_before_type_cast
    when 0
      'green'
    when 1
      'yellow'
    when 2
      'red'
    end
  end
end
