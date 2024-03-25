class Tobias < Furniture
  has_many :trusts, inverse_of: :tobias
  default_scope { where(furniture_kind: "tobias") }
  location(parent: :room)
end

# TOBIAS is hard to pluralize... Rails presumed TOBIAS was plural...
# So this tells Rails that TOBIAS is the singular form, and that TOBIASes
# is the plural.
ActiveSupport::Inflector.inflections(:en) do |inflect|
  inflect.plural(/^(tobias)$/i, '\1\2es')
  inflect.singular(/^(tobias)es/i, '\1')
end
