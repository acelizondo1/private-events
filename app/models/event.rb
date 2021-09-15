class Event < ApplicationRecord
    validates :name, presence: true

    belongs_to :creator, class_name: "User"
    has_many :invites, foreign_key: :invited_event
    has_many :invitees, through: :invites, class_name: "User"
    
end
