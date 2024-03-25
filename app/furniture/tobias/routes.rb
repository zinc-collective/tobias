class Tobias
  class Routes
    def self.append_routes(router)
      router.resources :tobiases, module: "tobias" do
        router.resources :trusts do
          router.resources :payouts
        end
      end
    end
  end
end
