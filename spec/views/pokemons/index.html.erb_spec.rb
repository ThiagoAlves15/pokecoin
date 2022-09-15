require 'rails_helper'

RSpec.describe "pokemons/index", type: :view do
  before(:each) do
    assign(:pokemons, [
      Pokemon.create!(
        name: "Name",
        base_experience: 2,
        sprite_url: "Sprite Url",
        user: nil
      ),
      Pokemon.create!(
        name: "Name",
        base_experience: 2,
        sprite_url: "Sprite Url",
        user: nil
      )
    ])
  end

  it "renders a list of pokemons" do
    render
    assert_select "tr>td", text: "Name".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: "Sprite Url".to_s, count: 2
    assert_select "tr>td", text: nil.to_s, count: 2
  end
end
