require "rails_helper"

RSpec.describe PokemonsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/pokemons").to route_to("pokemons#index")
    end

    it "routes to #new" do
      expect(get: "/pokemons/new").to route_to("pokemons#new")
    end

    it "routes to #create" do
      expect(post: "/pokemons").to route_to("pokemons#create")
    end
  end
end
