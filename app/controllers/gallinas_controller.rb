class GallinasController < ApplicationController
  before_action :set_gallina, only: [:show, :edit, :update, :destroy]

  # GET /gallinas
  # GET /gallinas.json
  def index
    @gallinas = Gallina.all
  end

  # GET /gallinas/1
  # GET /gallinas/1.json
  def show
  end

  # GET /gallinas/new
  def new
    @gallina = Gallina.new
  end

  # GET /gallinas/1/edit
  def edit
  end

  # POST /gallinas
  # POST /gallinas.json
  def create
    @gallina = Gallina.new(gallina_params)

    respond_to do |format|
      if @gallina.save
        format.html { redirect_to @gallina, notice: 'Gallina was successfully created.' }
        format.json { render :show, status: :created, location: @gallina }
      else
        format.html { render :new }
        format.json { render json: @gallina.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /gallinas/1
  # PATCH/PUT /gallinas/1.json
  def update
    respond_to do |format|
      if @gallina.update(gallina_params)
        format.html { redirect_to @gallina, notice: 'Gallina was successfully updated.' }
        format.json { render :show, status: :ok, location: @gallina }
      else
        format.html { render :edit }
        format.json { render json: @gallina.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /gallinas/1
  # DELETE /gallinas/1.json
  def destroy
    @gallina.destroy
    respond_to do |format|
      format.html { redirect_to gallinas_url, notice: 'Gallina was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gallina
      @gallina = Gallina.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gallina_params
      params.require(:gallina).permit(:name, :image, :description)
    end
end
