require 'rails_helper'

RSpec.describe "sales/index", type: :view do
  let(:user) { create(:user) }
  let(:pokemon_one) { create(:pokemon, user: user) }
  let(:pokemon_two) { create(:pokemon, user: user) }
  let(:sale_one) { create(:sale, from_user: user) }
  let(:sale_two) { create(:sale, from_user: user) }

  before(:each) do
    assign(:sales, [
      sale_one,
      sale_two
    ])
  end

  it "renders a list of sales" do
    render
    assert_select "h2", text: "Offers".to_s, count: 1
    assert_select "div>p>strong", text: "From user:".to_s, count: 2
    assert_select "div>p>strong", text: "To user:".to_s, count: 2
  end
end
