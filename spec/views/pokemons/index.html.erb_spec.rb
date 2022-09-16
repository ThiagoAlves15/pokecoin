require 'rails_helper'

RSpec.describe "pokemons/index", type: :view do
  let(:pokemon_one) { create(:pokemon) }
  let(:pokemon_two) { create(:pokemon) }

  before(:each) do
    @user = create(:user)
    sign_in @user

    assign(:pokemons, [
      pokemon_one,
      pokemon_two
    ])
  end

  it "renders a list of pokemons" do
    render
    assert_select "h2", text: "Pokemons".to_s, count: 1
    assert_select "div>p>strong", text: "Base experience:".to_s, count: 2
  end
end
