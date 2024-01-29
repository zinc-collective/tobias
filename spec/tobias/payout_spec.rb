require "rails_helper"
require_relative "factories/payout_factory"
require_relative "factories/beneficiary_factory"

RSpec.describe Tobias::Payout, type: :model do
  describe "#payments" do
    it { is_expected.to have_many(:payments).inverse_of(:payout).dependent(:destroy) }
  end

  describe "#issue" do
    it "issues a Payment to each Beneficiary for their share of the #amount" do
      payout = create(:tobias_payout, amount_cents: 150_00)

      beneficiaries = create_list(:tobias_beneficiary, 10, trust: payout.trust)

      payout.issue

      beneficiaries.each do |beneficiary|
        expect(beneficiary.payments).to exist(amount_cents: 15_00)
      end
    end

    context "when the Payout#amount does not divide evenly" do
      it "rounds down so that it can" do
        payout = create(:tobias_payout, amount_cents: 3_33)

        beneficiaries = create_list(:tobias_beneficiary, 2, trust: payout.trust)

        payout.issue

        beneficiaries.each do |beneficiary|
          expect(beneficiary.payments).to exist(amount_cents: 1_66)
        end
      end
    end

    context "when running twice" do
      it "does not issue multiple payouts, even when beneficiaries are added" do
        payout = create(:tobias_payout, amount_cents: 100_00)

        create_list(:tobias_beneficiary, 2, trust: payout.trust)

        payout.issue

        create(:tobias_beneficiary, trust: payout.trust)

        # ActiveRecord appears to be caching the `payout.beneficiaries` results
        # Reload busts that cache.
        payout.reload

        expect { payout.issue }.not_to(change(payout.payments, :count))
      end
    end
  end
end
