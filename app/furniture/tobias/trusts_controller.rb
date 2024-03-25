class Tobias
  class TrustsController < FurnitureController
    expose :trust, model: Trust

    def show
      authorize trust
    end
  end

  class TrustPolicy < ApplicationPolicy
    def show?
      true
    end
    alias_method :entry, :object
  end
end
