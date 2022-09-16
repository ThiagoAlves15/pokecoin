require 'rails_helper'

RSpec.describe "/pokemons", type: :request do

  # This should return the minimal set of attributes required to create a valid
  # Pokemon. As you add validations to Pokemon, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  describe "GET /index" do
    it "renders a successful response" do
      Pokemon.create! valid_attributes
      get pokemons_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      pokemon = Pokemon.create! valid_attributes
      get pokemon_url(pokemon)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_pokemon_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      pokemon = Pokemon.create! valid_attributes
      get edit_pokemon_url(pokemon)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Pokemon" do
        expect {
          post pokemons_url, params: { pokemon: valid_attributes }
        }.to change(Pokemon, :count).by(1)
      end

      it "redirects to the created pokemon" do
        post pokemons_url, params: { pokemon: valid_attributes }
        expect(response).to redirect_to(pokemon_url(Pokemon.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Pokemon" do
        expect {
          post pokemons_url, params: { pokemon: invalid_attributes }
        }.to change(Pokemon, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post pokemons_url, params: { pokemon: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested pokemon" do
        pokemon = Pokemon.create! valid_attributes
        patch pokemon_url(pokemon), params: { pokemon: new_attributes }
        pokemon.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the pokemon" do
        pokemon = Pokemon.create! valid_attributes
        patch pokemon_url(pokemon), params: { pokemon: new_attributes }
        pokemon.reload
        expect(response).to redirect_to(pokemon_url(pokemon))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        pokemon = Pokemon.create! valid_attributes
        patch pokemon_url(pokemon), params: { pokemon: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested pokemon" do
      pokemon = Pokemon.create! valid_attributes
      expect {
        delete pokemon_url(pokemon)
      }.to change(Pokemon, :count).by(-1)
    end

    it "redirects to the pokemons list" do
      pokemon = Pokemon.create! valid_attributes
      delete pokemon_url(pokemon)
      expect(response).to redirect_to(pokemons_url)
    end
  end
end
