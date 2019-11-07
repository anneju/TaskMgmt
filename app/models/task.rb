class Task < ApplicationRecord
  has_many :task_tags

  validates :title, :description, :start_time, :end_time, presence: true
  validates_datetime :end_time, on_or_after: :now
  validates_datetime :end_time, on_or_after: :start_time

  enum priority: { high: 0, medium: 1 ,low: 2 }
  enum status: { to_do: 0, doing: 1 ,done: 2 }

  default_scope { order('created_at DESC') }
end
