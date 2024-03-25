class Tobias
  class Trust < Record
    self.table_name = "tobias_trusts"

    belongs_to :tobias, inverse_of: :trusts

    location(parent: :tobias)

    has_many :beneficiaries, inverse_of: :trust, dependent: :destroy
    has_many :payouts, inverse_of: :trust, dependent: :destroy
  end
end
