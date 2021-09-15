class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :created_events, foreign_key: :creator_id, class_name: "Event"
  has_many :invites, foreign_key: :invitee_id
  has_many :invited_events, through: :invites, class_name: "Event"
end
