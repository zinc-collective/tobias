require "rails_helper"

RSpec.describe Tobias::Beneficiary, type: :model do
  describe "#trust" do
    it { is_expected.to belong_to(:trust).inverse_of(:beneficiaries) }
  end

  describe "#payments" do
    it { is_expected.to have_many(:payments).inverse_of(:beneficiary) }
  end

  describe "#payouts" do
    it { is_expected.to have_many(:payouts).through(:payments) }
  end
end
