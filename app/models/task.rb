class Task < ApplicationRecord
  VALID_FILTER = %w(all active completed)

  belongs_to :user

  validates :name, presence: true

  scope :active, -> { where(completed_at: nil) }
  scope :completed, -> { where.not(completed_at: nil) }
end
