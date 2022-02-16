class Event < ApplicationRecord
  validates :title, :location, :date, presence: true

  belongs_to :creator, class_name: "User", foreign_key: :creator_id
  has_many :sign_ups, dependent: :destroy, foreign_key: :attended_event_id
  has_many :attendees, through: :sign_ups, source: :attendee



  scope :past, -> {where('date < ?', Date.today)}
  scope :upcoming, -> {where('date >= ?', Date.today)}
end
