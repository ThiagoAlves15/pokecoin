class PokemonsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_pokemon, only: %i[ destroy ]

  # GET /pokemons or /pokemons.json
  def index
    @pokemons = Pokemon.where(user: current_user).order(:updated_at).all
  end

  # GET /pokemons/new
  def new
    @pokemon = Pokemon.new
  end

  # POST /pokemons or /pokemons.json
  def create
    @pokemon = Pokemon.new(pokemon_params)
    pokemon = get_pokemon_by_name(pokemon_params[:name])

    unless pokemon
      return redirect_to new_pokemon_url, status: :unprocessable_entity, alert: 'Pokemon not found'
    end

    @pokemon.name = pokemon['name']
    @pokemon.base_experience = pokemon['base_experience']
    @pokemon.sprite_url = pokemon['sprites']['front_default']
    @pokemon.user = current_user

    respond_to do |format|
      if @pokemon.save
        format.html { redirect_to pokemon_url(@pokemon), notice: "Pokemon was successfully created." }
        format.json { render :show, status: :created, location: @pokemon }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pokemon.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def set_pokemon
      @pokemon = Pokemon.find(params[:id])
    end

    def pokemon_params
      params.require(:pokemon).permit(:name, :user_id)
    end

    def get_pokemon_by_name(name)
      uri = URI("https://pokeapi.co/api/v2/pokemon/#{name}/")
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      request = Net::HTTP::Get.new(uri.path, {'Content-Type' => 'application/json'})
      response = http.request(request)

      return nil if response.code != '200'

      JSON.parse(response.body)
    end
end
