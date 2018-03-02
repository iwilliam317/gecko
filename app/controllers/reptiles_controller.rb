class ReptilesController < ApplicationController
  before_action :set_reptile, only: [:show, :edit, :update, :destroy]
  before_action :load_resources , only: %w(new create edit)
  before_action :authenticate_user!

  # GET /reptiles
  # GET /reptiles.json
  def index    
    @reptiles = Reptile.search(params[:search]) if params[:search].present?
    @reptiles = Reptile.all unless params[:search].present?
  end

  # GET /reptiles/1
  # GET /reptiles/1.json
  def show
    respond_with @reptile    
  end

  # GET /reptiles/new
  def new
    @reptile = Reptile.new
    respond_with @reptile   
  end

  # GET /reptiles/1/edit
  def edit
    respond_with @reptile
  end

  # POST /reptiles
  # POST /reptiles.json
  def create
    @reptile = Reptile.new(reptile_params)   
    @reptile.save 
    respond_with @reptile
end

  # PATCH/PUT /reptiles/1
  # PATCH/PUT /reptiles/1.json
  def update
    respond_with @reptile

  end

  # DELETE /reptiles/1
  # DELETE /reptiles/1.json
  def destroy
    @reptile.avatar = nil
    @reptile.destroy
    respond_with @reptile

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reptile
      @reptile = Reptile.find(params[:id])
    end

    def load_resources
     @male_reptile = Reptile.male_only
     @female_reptile = Reptile.female_only
   end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reptile_params
      params.require(:reptile).permit(:name, :specie, :birthday, :gender, :weight, :morphological_pattern, :morphological_father, :morphological_mother, :new_animal, :avatar)
    end
  end
