class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'

  scope :past, -> { where('date < ?', DateTime.now) }
  scope :upcoming, -> { where('date > ?', DateTime.now) }

  validates :title, presence: true, length: 4..30
  validates :description, presence: true, length: { maximum: 400 }
  validates :date, presence: true
  validates :location, presence: true, length: { maximum: 40 }
end
