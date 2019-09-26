
FactoryBot.define do
  factory :event_attendee do
    association :attendee, factory: [:user, :event]
  end

  factory :random_event_attendee, class: EventAttendee do
    association :attendee, factory: [:user, :event]
  end
end
