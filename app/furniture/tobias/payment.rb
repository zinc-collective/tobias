class Tobias
  class Payment < ApplicationRecord
    self.table_name = "tobias_payments"

    belongs_to :payout

    monetize :amount_cents
  end
end
