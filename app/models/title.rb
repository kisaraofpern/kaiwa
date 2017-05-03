class Title < ApplicationRecord
  validates :full_title, presence: true
  validates :language, presence: true
end
