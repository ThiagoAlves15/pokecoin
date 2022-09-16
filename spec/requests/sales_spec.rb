require 'rails_helper'

RSpec.describe "/sales", type: :request do
  before(:each) do
    @user = create(:user)
    sign_in @user
  end

  let(:pokemon) { create(:pokemon, user: @user) }

  let(:valid_attributes) {
    {
      from_user: @user,
      pokemon: pokemon
    }
  }

  let(:invalid_attributes) {
    {
      from_user: nil,
      pokemon: nil
    }
  }

  describe "GET /index" do
    it "renders a successful response" do
      Sale.create! valid_attributes
      get sales_url
      expect(response).to be_successful
    end
  end

  describe "GET /user/acquisitions" do
    it "renders a successful response" do
      Sale.create! valid_attributes
      get user_acquisitions_path
      expect(response).to be_successful
    end
  end

  describe "GET /user/sales" do
    it "renders a successful response" do
      Sale.create! valid_attributes
      get user_sales_path
      expect(response).to be_successful
    end
  end

  describe "POST /sales/create" do
    context "with valid parameters" do
      it "creates a new Sale" do
        expect {
          post sales_create_path, params: { sale: valid_attributes, pokemon_id: pokemon.id }
        }.to change(Sale, :count).by(1)
      end

      it "redirects to the created sale" do
        post sales_create_path, params: { sale: valid_attributes, pokemon_id: pokemon.id }
        expect(response).to redirect_to(pokemons_url)
      end
    end

    context "with invalid parameters" do
      it "does not create a new Sale" do
        expect {
          post sales_create_path, params: { sale: invalid_attributes }
        }.to change(Sale, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post sales_create_path, params: { sale: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested sale" do
        sale = Sale.create! valid_attributes
        patch sale_url(sale), params: { sale: new_attributes }
        sale.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the sale" do
        sale = Sale.create! valid_attributes
        patch sale_url(sale), params: { sale: new_attributes }
        sale.reload
        expect(response).to redirect_to(sale_url(sale))
      end
    end

    context "with invalid parameters" do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        sale = Sale.create! valid_attributes
        patch sale_url(sale), params: { sale: invalid_attributes }
        expect(response).to redirect_to(sales_path)
      end
    end
  end
end
