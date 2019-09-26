# FactoryGirl.define do
#  factory :event_attendee do
#    attendee_id 1
#    attended_event_id 1
#  end
# end

FactoryBot.define do
  factory :event_attendee do
    association :attendee, factory: %i[user event]
  end

  factory :random_event_attendee, class: EventAttendee do
    association :attendee, factory: %i[user event]
  end
end
