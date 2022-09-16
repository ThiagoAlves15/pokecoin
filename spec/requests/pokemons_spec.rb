require 'rails_helper'

RSpec.describe "/pokemons", type: :request do
  let(:valid_attributes) {
    {
      name: 'bulbasaur',
      base_experience: Faker::Number.between(from: 10, to: 1000),
      sprite_url: Faker::Avatar.image,
      user_id: @user.id
    }
  }

  let(:invalid_attributes) {
    {
      name: 'teste',
      base_experience: nil,
      sprite_url: nil,
      user_id: nil
    }
  }

  before(:each) do
    @user = create(:user)
    sign_in @user
  end

  describe "GET /index" do
    it "renders a successful response" do
      Pokemon.create! valid_attributes
      get pokemons_url
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_pokemon_url
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
        expect(response).to redirect_to(pokemons_url)
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
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
