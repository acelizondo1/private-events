class Event < ApplicationRecord
    validates :name, presence: true
    validates :location, presence: true
    validates :date, presence: true

    belongs_to :creator, class_name: "User"
    has_many :invites, foreign_key: :invited_event
    has_many :invitees, through: :invites, class_name: "User"
    
    scope :past, -> { where("date < ?", Date.today) }
    scope :future, -> { where("date > ?", Date.today) }
end
