class Tobias
  class TrustsController < FurnitureController
    expose :trust, model: Trust

    def show
      authorize trust
    end
  end
end
