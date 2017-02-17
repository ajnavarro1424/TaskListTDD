require_relative 'task'
require_relative 'task_list'

class DueDateTask < Task
  def initialize(year, month, day)
    @due_date = Date.new(year, month, day)
  end
  def get_duedate
    @due_date
  end
  def print_status
    @status = ("Title: " + get_title.to_s + "Description: " + get_description.to_s + "Due Date: " + get_duedate.to_s)
  end
end
