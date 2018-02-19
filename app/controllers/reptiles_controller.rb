class ReptilesController < ApplicationController
  before_action :set_reptile, only: [:show, :edit, :update, :destroy]
  before_action :load_resources , only: %w(new create edit)

  # GET /reptiles
  # GET /reptiles.json
  def index
    @reptiles = Reptile.all
  end

  # GET /reptiles/1
  # GET /reptiles/1.json
  def show
  end

  # GET /reptiles/new
  def new
    @reptile = Reptile.new
   
  end

  # GET /reptiles/1/edit
  def edit
  end

  # POST /reptiles
  # POST /reptiles.json
  def create
    @reptile = Reptile.new(reptile_params)
    
    respond_to do |format|
      if @reptile.save
        format.html { redirect_to @reptile, notice: 'Reptile was successfully created.' }
        format.json { render :show, status: :created, location: @reptile }
      else
        format.html { render :new }
        format.json { render json: @reptile.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reptiles/1
  # PATCH/PUT /reptiles/1.json
  def update
    respond_to do |format|
      if @reptile.update(reptile_params)
        format.html { redirect_to @reptile, notice: 'Reptile was successfully updated.' }
        format.json { render :show, status: :ok, location: @reptile }
      else
        format.html { render :edit }
        format.json { render json: @reptile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reptiles/1
  # DELETE /reptiles/1.json
  def destroy
    @reptile.avatar = nil
    @reptile.destroy
    respond_to do |format|
      format.html { redirect_to reptiles_url, notice: 'Reptile was successfully destroyed.' }
      format.json { head :no_content }
    end
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
