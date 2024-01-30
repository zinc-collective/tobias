class Tobias
  class Beneficiary < ApplicationRecord
    self.table_name = "tobias_beneficiaries"

    belongs_to :trust, inverse_of: :beneficiaries

    has_many :payments, inverse_of: :beneficiary
    has_many :payouts, through: :payments
  end
end
