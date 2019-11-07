FactoryBot.define do
  factory :task do
    title { Faker::Verb.base }
    description { Faker::Lorem.sentence(word_count: 3, supplemental: true) }
    start_time { DateTime.now }
    end_time { (DateTime.now + 1) }
    priority { "low" }
    status { "to_do" }
  end
end
