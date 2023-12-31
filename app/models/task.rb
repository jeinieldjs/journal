class Task < ApplicationRecord
  belongs_to :category
  validates :title, presence: true
  validates :description, presence: true
  validates :due_date, presence: true
end
