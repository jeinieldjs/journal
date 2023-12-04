class AddUserIdToCategories < ActiveRecord::Migration[7.1]
  def change
    add_reference :categories, :user, foreign_key: true, null: true
    Category.update_all(user_id: User.first&.id)
    change_column_null :categories, :user_id, false
  end
end

