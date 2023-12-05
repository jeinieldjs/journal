require "test_helper"

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  include Devise::Test::IntegrationHelpers
  
  setup do
      @user = users(:one)
      sign_in @user
      @category = categories(:one)
  end

  test 'should get index' do 
    get categories_path
    assert_response :success
  end

  test 'should get new' do 
    get new_category_path
    assert_response :success
 
  end

  test 'should create category' do
    assert_difference('Category.count') do
      post categories_path, params: {category: {title: 'New Title', description: 'New Description'}}
    end

    assert_redirected_to category_path(Category.last)
  end

  test 'should show category' do 
    get category_path(@category)
    assert_response :success
  end

  test 'should get edit' do 
    get edit_category_path(@category)
    assert_response :success
  end

  test 'should update category' do
    patch category_path(@category), params: {category: {title: 'Updated Title', description: 'Updated Description'}}
    assert_redirected_to category_path(@category)
    @category.reload
    assert_equal 'Updated Title', @category.title
    assert_equal 'Updated Description', @category.description
  end

  test 'should destroy category' do
    assert_difference('Category.count', -1) do
      delete category_path(@category)
    end

    assert_redirected_to categories_path
  end
end
