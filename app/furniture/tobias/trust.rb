class Tobias
  class Trust < ApplicationRecord
    self.table_name = "tobias_trusts"

    has_many :beneficiaries, inverse_of: :trust, dependent: :destroy
    has_many :payouts, inverse_of: :trust, dependent: :destroy
  end
end
