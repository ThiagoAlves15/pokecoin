require 'rails_helper'

RSpec.describe "pokemons/edit", type: :view do
  before(:each) do
    @pokemon = assign(:pokemon, Pokemon.create!(
      name: "MyString",
      base_experience: 1,
      sprite_url: "MyString",
      user: nil
    ))
  end

  it "renders the edit pokemon form" do
    render

    assert_select "form[action=?][method=?]", pokemon_path(@pokemon), "post" do

      assert_select "input[name=?]", "pokemon[name]"

      assert_select "input[name=?]", "pokemon[base_experience]"

      assert_select "input[name=?]", "pokemon[sprite_url]"

      assert_select "input[name=?]", "pokemon[user_id]"
    end
  end
end
