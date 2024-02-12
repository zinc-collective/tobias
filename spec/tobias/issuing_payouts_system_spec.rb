require "rails_helper"
require_relative "factories/trust_factory"
require_relative "factories/beneficiary_factory"

# @see https://github.com/zinc-collective/tobias/issues/11
RSpec.describe "Tobias: Issuing a Payout", type: :system do
  scenario "Issuing a `Payout` to multiple `Beneficiaries`" do # rubocop:disable RSpec/Capybara/FeatureMethods,RSpec/ExampleLength
    trust = create(:tobias_trust)
    beneficiaries = create_list(:tobias_beneficiary, 10, trust:)
    visit(polymorphic_path(trust.location))
    click_link("New Payout")
    fill_in("Amount", with: 250_00)

    click_button("Create Payout")

    click_button("Issue Payout")

    expect(page).to have_content("$25.00 Payments Issued to 10 Beneficiaries")
    beneficiaries.each do |beneficiary|
      expect(page).to have_content("#{beneficiary.name} $25.00 Pending")
    end
  end
end
