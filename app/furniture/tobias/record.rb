class Tobias
  class Record < ApplicationRecord
    self.abstract_class = true
    extend StripsNamespaceFromModelName
  end
end
