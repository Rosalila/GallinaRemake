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

    if !current_user.belongs_to_corral(@gallina.corral.id)
      redirect_to "/"
      return
    end

    if @gallina.save
      redirect_to @gallina.corral
    else
      redirect_to "/"
    end
  end

  # PATCH/PUT /gallinas/1
  # PATCH/PUT /gallinas/1.json
  def update
    if !current_user.belongs_to_corral(@gallina.corral.id)
      redirect_to "/"
      return
    end

    if @gallina.update(gallina_params)
      redirect_to @gallina.corral
    else
      redirect_to "/"
    end
  end

  # DELETE /gallinas/1
  # DELETE /gallinas/1.json
  def destroy
    if !current_user.belongs_to_corral(@gallina.corral.id)
      redirect_to "/"
      return
    end

    @gallina.destroy
    redirect_to "/"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gallina
      @gallina = Gallina.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def gallina_params
      params.require(:gallina).permit(:name, :image, :description, :corral_id)
    end
end
