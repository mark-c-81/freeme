class Skill < ApplicationRecord
  belongs_to :user
  belongs_to :icon

  validates :level, inclusion: { in: %w(novice advanced-beginner competent proficient expert) }
end
