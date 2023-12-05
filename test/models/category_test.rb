require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:one)
    sign_in @user
  end

  test 'should not save category without title' do
    category = Category.new(description: 'Pet-related tasks')
    assert_not category.save, 'Saved the category without a title'
  end

  test 'should not save category without description' do
    category = Category.new(title: 'Pets')
    assert_not category.save, 'Saved the category without a description'
  end

  test 'should save category with title and description' do
    category = Category.new(title: 'Pets', description: 'Pet-related tasks', user: @user)
    assert category.save, 'Could not save the valid category'
  end
end
