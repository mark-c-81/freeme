class Icon < ApplicationRecord
  has_many :skills

  has_one_attached :photo
end
