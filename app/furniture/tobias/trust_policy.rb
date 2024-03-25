class Tobias
  class TrustPolicy < ApplicationPolicy
    def show?
      true
    end
    alias_method :entry, :object
  end
end
