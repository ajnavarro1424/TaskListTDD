require_relative 'task'

class TaskList
  def initialize
    @tasks = []
    @date_tasks = []
  end
  # All the getter methods below, they return their associated instance variables
  def tasks
    @tasks
  end
  # Returns the incomplete tasks array
  def tasks_incomp
    tasks.select do |task|
      if !task.done?
        tasks_incomp << task
      end
    end
  end
  # Returns the complete tasks array
  def tasks_done
    tasks.select do |task|
      if task.done?
        tasks << task
      end
    end
  end
  # Returns the date tasks array
  def date_tasks
    @date_tasks
  end
  # Returns the date tasks that are incomplete
  def date_tasks_incomp
    date_tasks.select do |task|
      if !task.done?
        date_tasks_incomp << task
      end
    end

  end
  # Returns the date tasks that are incomplete & due today
  def date_tasks_incompdue
    date_tasks.select do |task|
      if !task.done? && (task.duedate.to_s == Date.today.to_s)
        date_tasks_incompdue << task
      end
    end
  end
end
