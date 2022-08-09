class Attempt < ApplicationRecord
  belongs_to :user
  belongs_to :workout

  validates :name, presence: true
end
