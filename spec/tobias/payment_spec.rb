require "rails_helper"

RSpec.describe Tobias::Payment, type: :model do
  describe "#payout" do
    it { is_expected.to belong_to(:payout).inverse_of(:payments) }
  end

  describe "#amount" do
    it { is_expected.to monetize(:amount) }
  end
end
