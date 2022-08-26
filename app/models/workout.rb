class Workout < ApplicationRecord
    include Visible 
    
    belongs_to :user
    has_many :attempts, dependent: :delete_all
    validates :trainer, presence: true
    validates :warmup, presence: true, length: {minimum: 1}
    validates :body, presence: true, length: {minimum: 1}
    validates :finish, presence: true, length: {minimum: 1}
end
