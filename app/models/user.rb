class User < ApplicationRecord
    has_secure_password
    has_many :workouts, dependent: :destroy
    has_many :attempts, dependent: :destroy
end
