require 'rails_helper'

RSpec.describe "/sales", type: :request do
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
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

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Sale" do
        expect {
          post sales_url, params: { sale: valid_attributes }
        }.to change(Sale, :count).by(1)
      end

      it "redirects to the created sale" do
        post sales_url, params: { sale: valid_attributes }
        expect(response).to redirect_to(sale_url(Sale.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Sale" do
        expect {
          post sales_url, params: { sale: invalid_attributes }
        }.to change(Sale, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post sales_url, params: { sale: invalid_attributes }
        expect(response).to be_successful
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
        expect(response).to be_successful
      end
    end
  end
end
