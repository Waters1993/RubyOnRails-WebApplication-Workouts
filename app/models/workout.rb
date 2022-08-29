class Workout < ApplicationRecord
    include Visible 
    
    belongs_to :user
    has_many :attempts, dependent: :delete_all
    validates :trainer, presence: true
    validates :warmup, presence: true, length: {minimum: 10}
    validates :body, presence: true, length: {minimum: 10}
    validates :finish, presence: true
end
