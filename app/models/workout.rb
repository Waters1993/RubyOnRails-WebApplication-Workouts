class Workout < ApplicationRecord
    belongs_to :user
    has_many :attempts
    validates :trainer, presence: true
    validates :name, presence: true
    validates :description, presence: true
    validates :warmup, presence: true, length: {minimum: 1}
    validates :body, presence: true, length: {minimum: 1}
    validates :finish, presence: true, length: {minimum: 1}
end
