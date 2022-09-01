class Workout < ApplicationRecord
    include Visible 
    
    belongs_to :user
    has_many :attempts, dependent: :delete_all
    validates :trainer, presence: true
    validates :warmup, presence: true, length: {minimum: 10}
    validates :body, presence: true, length: {minimum: 10}
    validates :finish, presence: true

    def self.find_public
        where(status: "public").order(created_at: :DESC)
    end

    def self.random
        where(status: "public").order(Arel.sql('RANDOM()')).first
    end

    def self.belonging_to_user(session_data)
        where("user_id = ?", session_data)
    end

end
