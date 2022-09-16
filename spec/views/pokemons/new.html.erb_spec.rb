require 'rails_helper'

RSpec.describe "pokemons/new", type: :view do
  let(:pokemon_one) { create(:pokemon) }

  before(:each) do
    @user = create(:user)
    sign_in @user

    assign(:pokemon, pokemon_one)
  end

  xit "renders new pokemon form" do
    render

    assert_select "form[action=?][method=?]", pokemons_path, "post" do
      assert_select "input[name=?]", "pokemon[name]"
    end
  end
end
