require_relative 'task'

class TaskList
  def initialize
    @task_array = []
    @done_array = []
    @notdone_array = []
  end
  # make a method that populates task_array
  def push_taskarray(task)
    @task_array << task
  end
  # make a method that retuns task_array
  def get_taskarray
    @task_array
  end
  # make a method to populate done_array
  def push_donearray
    get_taskarray.each do |object|
      if object.status_done
        get_donearray.push(object)
      end
    end
  end
  def push_notdonearray
    get_taskarray.each do |object|
      if !object.status_done
        get_notdonearray.push(object)
      end
    end
  end
  def get_notdonearray
    @notdone_array
  end
  def get_donearray
    @done_array
  end

end
