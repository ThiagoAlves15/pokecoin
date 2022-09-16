class SalesController < ApplicationController
  before_action :authenticate_user!, only: %i[ acquisitions sales create update destroy ]
  before_action :set_sale, only: %i[ update destroy ]

  # GET /sales or /sales.json
  def index
    @sales = Sale.where(to_user_id: nil).all
  end

  def acquisitions
    @sales = Sale.where(to_user: current_user).all
  end

  def sales
    @sales = Sale.where(from_user: current_user).all
  end

  # POST /sales or /sales.json
  def create
    pokemon = current_user.pokemons.find_by(id: params['pokemon_id'])

    unless pokemon
      return redirect_to root_path, status: :unprocessable_entity, alert: 'Pokemon not found'
    end

    @sale = Sale.new(from_user: current_user, pokemon: pokemon)

    respond_to do |format|
      if @sale.save
        format.html { redirect_to sale_url(@sale), notice: "Sale was successfully created." }
        format.json { render :show, status: :created, location: @sale }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sales/1 or /sales/1.json
  def update
    pokemon = @sale.pokemon
    pokemon.user = current_user
    @sale.to_user = current_user

    respond_to do |format|
      if @sale.save && pokemon.save
        format.html { redirect_to sales_path, notice: "Sale was successfully updated." }
        format.json { render :show, status: :ok, location: @sale }
      else
        format.html { redirect_to sales_path, status: :unprocessable_entity, alert: "Sale was unsuccessfully updated." }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sales/1 or /sales/1.json
  def destroy
    @sale.destroy

    respond_to do |format|
      format.html { redirect_to sales_url, notice: "Sale was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

    def set_sale
      @sale = Sale.find(params[:id])
    end

    def sale_params
      params.permit(:from_user_id, :to_user_id, :pokemon_id)
    end
end
