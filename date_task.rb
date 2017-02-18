require_relative 'task'
require_relative 'task_list'

class DateTask < Task
  def initialize(year, month, day)
    @due_date = Date.new(year, month, day)
  end
  def duedate
    @due_date
  end
  def status
    @status = ("Title: " + title.to_s + "Description: " + description.to_s + "Due Date: " + duedate.to_s)
  end
end
