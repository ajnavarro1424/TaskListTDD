require 'rspec'
require_relative 'task'
require_relative 'task_list'
require_relative 'duedatetask'


describe DueDateTask do
  let(:duedatetask) {duedatetask = DueDateTask.new(2017,2,3)}
  # Story: As a developer, I can create a DueDateTask, which is-a Task that has-a due date.
  # Hint: Use the built-in Ruby Date class
  it "has the ability to make a DueDateTask object with a due date" do
    expect{DueDateTask.new(2017,2,3)}.not_to raise_error
  end
  # Story: As a developer, I can print an item with a due date with labels and values.
  # Hint: When implementing to_s, use super to call to_s on the super class.
  it "has to print the task with labels and values" do
    expect(duedatetask.print_status).to eq("Title: " + duedatetask.get_title.to_s + "Description: " + duedatetask.get_description.to_s + "Due Date: " + duedatetask.get_duedate.to_s)
  end

end

describe Task do
  let (:task) {task = Task.new("Shopping List", "Buy Food: Whiskey, Happiness")}
  # Story: As a developer, I can create a Task.
  it "has to be able to make a new task" do
   expect{Task.new("Shopping List", "Description")}.not_to raise_error
  end
  # Story: As a developer, I can give a Task a title and retrieve it.
  it "has to have a title that can be returned" do
    # task = Task.new("Shopping List", "Description")
    expect(task.get_title).to be_a String
  end
  # Story: As a developer, I can give a Task a description and retrieve it.
  it "has to have a description that can be returned" do
    # task = Task.new("Shopping List", "Description")
    expect(task.get_description).to be_a String
  end
  # Story: As a developer, I can mark a Task done.
  it "has to be able to be marked done " do
    expect(task.mark_done).to be true
  end
  # Story: As a developer, when I print a Task that is done, its status is shown.
  # Hint: Implement to_s have it return the features of a Task with labels (for instance, "Title:" + @title Description: Bananas, milk").
  it "has to print a task that is done, and show its status" do
    task.mark_done
    expect(task.print_status).to eq("Title: " + task.get_title.to_s + "Description: " + task.get_description.to_s)
  end

end

describe TaskList do
  let (:task1) {task1 = Task.new("Shopping List", "Buy Food")}
  let (:task2) {task2 = Task.new("Car To Do", "Oil Change")}
  let (:task3) {task3 = Task.new("Bills", "Pay Bills")}
  let (:tasklist) {tasklist = TaskList.new}
  # Story: As a developer, I can add all of my Tasks to a TaskList.
  # Hint: A TaskList has-many Tasks
  it "has to be able to add a tasks to a TaskList" do
    expect(tasklist.push_taskarray(task1)).to match_array [task1]
    expect(tasklist.push_taskarray(task2)).to match_array [task1, task2]
    expect(tasklist.push_taskarray(task3)).to match_array [task1, task2, task3]
  end
  # Story: As a developer with a TaskList, I can get the completed items.
  it "with a TaskList, we can return the completed items" do
    task1.mark_done
    task3.mark_done
    tasklist.push_taskarray(task1)
    tasklist.push_taskarray(task2)
    tasklist.push_taskarray(task3)
    tasklist.push_donearray
    expect(tasklist.get_donearray).to match_array [task1,task3]
  end
  # Story: As a developer with a TaskList, I can get the incomplete items.
  it "with a TaskList, we can return the incomplete items" do
    task1.mark_done
    task2.mark_done
    tasklist.push_taskarray(task1)
    tasklist.push_taskarray(task2)
    tasklist.push_taskarray(task3)
    tasklist.push_notdonearray
    expect(tasklist.get_notdonearray).to match_array [task3]

  end
end
