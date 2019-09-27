class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'
  has_many :event_attendees, foreign_key: 'attended_event_id'
  has_many :attendees, through: :event_attendees, foreign_key: 'attendee_id'

  scope :past, -> { where('date < ?', DateTime.now) }
  scope :upcoming, -> { where('date > ?', DateTime.now) }

  validates :title, presence: true, length: 4..30
  validates :description, presence: true, length: 4..400
  validates :date, presence: true
  validates :location, presence: true, length: 4..50
end
