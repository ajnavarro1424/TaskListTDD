require_relative 'task_list'
class Task < TaskList
  #
  def initialize(title, description)
    # Title taken in by the user
    @title = title
    # Description taken in by the user
    @description = description
    # when the task is not complete the value is false
    @done = false
    # status instance variable that holds the status of the task
    @status = ""
  end
  # Returns the current title
  def title
    @title
  end
  # Returns the current descpription
  def description
    @description
  end
  # Marks the status as true, and returns task done
  def done
    @done = true
  end
  def done?
    @done
  end
  def status
    if done?
      @status = ("Title: " + title.to_s + "Description: " + description.to_s)
    end
  end

end
