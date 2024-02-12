require_relative "tobias_factory"

FactoryBot.define do
  factory :tobias_trust, class: "Tobias::Trust" do
    tobias
  end
end
