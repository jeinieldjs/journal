require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test 'should have many categories' do 
    user = users(:one)
    assert_respond_to user, :categories
  end

  test 'should destroy associated categories' do 
    user = users(:one)
    category = user.categories.create(title: 'Sample')

    assert_difference('Category.count', -1) do
      user.destroy
    end
  end
end
