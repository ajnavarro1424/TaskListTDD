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
  def get_title
    @title
  end
  # Returns the current descpription
  def get_description
    @description
  end
  # Marks the status as true, and returns task done
  def mark_done
    @done = true
  end
  def status_done
    @done
  end
  def print_status
    if status_done
      @status = ("Title: " + get_title.to_s + "Description: " + get_description.to_s)
    end
  end

end
