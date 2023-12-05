require "test_helper"

class TasksControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  include Devise::Test::IntegrationHelpers
  
  setup do
    @user = users(:one)
    sign_in @user
    @category = categories(:one)
    @task = tasks(:one)
  end

  test "should get index" do
    get category_tasks_path(@category)
    assert_response :success
  end

  test "should get new" do
    get new_category_task_path(@category)
    assert_response :success
  end

  test "should create task" do
    assert_difference("Task.count") do
      post category_tasks_path(@category), params: {task: {title: @task.title,  description: @task.description, due_date: @task.due_date}}
    end

    assert_redirected_to category_task_path(@category, Task.last)
  end

  test "should show task" do
    get category_task_path(@category, @task)
    assert_response :success
  end

  test "should get edit" do
    get edit_category_task_path(@category, @task)
    assert_response :success
  end

  test "should update task" do
    patch category_task_path(@category, @task), params: {task: {title: @task.title, description: @task.description, due_date: @task.due_date}}
    assert_redirected_to category_task_path(@category, @task)
  end

  test "should destroy task" do
    assert_difference("Task.count", -1) do
      delete category_task_path(@category, @task)
    end

    assert_redirected_to category_path(@category)
  end
end

