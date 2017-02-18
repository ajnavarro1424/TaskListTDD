require 'rspec'
require_relative 'task'
require_relative 'task_list'
require_relative 'date_task'


describe DateTask do
  let(:date_task) {date_task = DateTask.new(2017,02,03)}
  # Story: As a developer, I can create a DateTask, which is-a Task that has-a due date.
  # Hint: Use the built-in Ruby Date class
  it "has the ability to make a DateTask object with a due date" do
    expect{DateTask.new(2017,02,03)}.not_to raise_error
  end
  # Story: As a developer, I can print an item with a due date with labels and values.
  # Hint: When implementing to_s, use super to call to_s on the super class.
  it "has to print the task with labels and values" do
    expect(date_task.status).to eq("Title: " + date_task.title.to_s + "Description: " + date_task.description.to_s + "Due Date: " + date_task.duedate.to_s)
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
    expect(task.title).to be_a String
  end
  # Story: As a developer, I can give a Task a description and retrieve it.
  it "has to have a description that can be returned" do
    # task = Task.new("Shopping List", "Description")
    expect(task.description).to be_a String
  end
  # Story: As a developer, I can mark a Task done.
  it "has to be able to be marked done " do
    expect(task.done).to be true
  end
  # Story: As a developer, when I print a Task that is done, its status is shown.
  # Hint: Implement to_s have it return the features of a Task with labels (for instance, "Title:" + @title Description: Bananas, milk").
  it "has to print a task that is done, and show its status" do
    task.done
    expect(task.status).to eq("Title: " + task.title.to_s + "Description: " + task.description.to_s)
  end

end

describe TaskList do
  let (:task1) {task1 = Task.new("Shopping List", "Buy Food")}
  let (:task2) {task2 = Task.new("Car To Do", "Oil Change")}
  let (:task3) {task3 = Task.new("Bills", "Pay Bills")}
  let (:date_task1) {date_task1 = DateTask.new(2017,02,17)}
  let (:date_task2) {date_task2 = DateTask.new(2015,12,5)}
  let (:date_task3) {date_task3 = DateTask.new(2019,03,20)}
  let (:tasklist) {tasklist = TaskList.new}
  # before(:each) {
  #   tasklist.tasks.push(task1,task2,task3)
  # }
  # before(:each){
  #   tasklist.date_tasks.push(date_task1, date_task2, date_task3)
  # }
  # Story: As a developer, I can add all of my Tasks to a TaskList.
  # Hint: A TaskList has-many Tasks
  it "has to be able to add a tasks to a TaskList" do
    tasklist.tasks.push(task1,task2,task3)
    expect(tasklist.tasks).to match_array [task1, task2, task3]
  end

  # Story: As a developer with a TaskList, I can get the completed items.
  it "with a TaskList, we can return the completed items" do
    task1.done
    task3.done
    tasklist.tasks.push(task1,task2,task3)
    expect(tasklist.tasks_done).to match_array [task1,task3]
  end
  # Story: As a developer with a TaskList, I can get the incomplete items.
  it "with a TaskList, we can return the incomplete items" do
    task1.done
    task2.done
    tasklist.tasks.push(task1,task2,task3)
    expect(tasklist.tasks_incomp).to match_array [task3]
  end
  # Story: As a developer, I can add items with due dates to my TaskList.
  # Hint: Consider keeping items with due dates separate from the other items.
  it "has the ability to add items with due dates to a TaskList" do
    tasklist.date_tasks.push(date_task1, date_task2, date_task3)
    expect(tasklist.date_tasks).to match_array [date_task1,date_task2,date_task3]
  end
  # Story: As a developer with a TaskList, I can list all the not completed items that are due today.
  it "has to be able to return duedatetasks that are not completed and due today" do
    date_task2.done
    tasklist.date_tasks.push(date_task1, date_task2, date_task3)
    expect(tasklist.date_tasks_incompdue).to match_array [date_task1]
  end
  # Story: As a developer with a TaskList, I can list all the not completed items in order of due date.
  # it "has to be able to return the duedatetasks that are not completed and order them by date " do
  #   date_task2.done
  #
  #   tasklist.push_notdone_duedate_array
  #   tasklist.sort_notdone_duedate_array
  #   expect(tasklist.date_tasks_incomp) to equal [task1, task3] ORDERED
  #
  # end
end
