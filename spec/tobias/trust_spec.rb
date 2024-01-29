require "rails_helper"

RSpec.describe Tobias::Trust, type: :model do
  describe "#benificiaries" do
    it { is_expected.to have_many(:beneficiaries).inverse_of(:trust).dependent(:destroy) }
  end
end
