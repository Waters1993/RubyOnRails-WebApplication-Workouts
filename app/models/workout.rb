class Workout < ApplicationRecord
    has_many :attempts
    validates :trainer, presence: true
    validates :name, presence: true
    validates :description, presence: true
    validates :warmup, presence: true, length: {minimum: 10}
    validates :body, presence: true, length: {minimum: 10}
    validates :finish, presence: true, length: {minimum: 10}
end
