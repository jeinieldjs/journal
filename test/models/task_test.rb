require "test_helper"

class TaskTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test 'should not save task without title' do
    task = Task.new(description: 'Take Tayto to the vet', category: categories(:one))
    assert_not task.save, 'Saved the task without a title'
  end

  test 'should not save task without description' do
    task = Task.new(title: 'Vet day', category: categories(:one))
    assert_not task.save, 'Saved the task without a description'
  end

  test 'should save task with title, description, and category' do
    task = Task.new(title: 'Vet Day', description: 'Take Tayto to the vet', category: categories(:one))
    assert task.save, 'Could not save the valid task'
  end
end
