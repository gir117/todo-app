class Todo < ActiveRecord::Base
  def to_s
  "Task: #{self.task} Deadline: #{self.due_date} Complete?: #{self.complete}"
  end
end
