class ReviewedsController < ApplicationController
  before_action :set_reviewed, only: [:show, :edit, :update, :destroy]

  # GET /revieweds
  # GET /revieweds.json
  def index
    @revieweds = Reviewed.all
  end

  # GET /revieweds/1
  # GET /revieweds/1.json
  def show
  end

  # GET /revieweds/new
  def new
    @reviewed = Reviewed.new
  end

  # GET /revieweds/1/edit
  def edit
  end

  # POST /revieweds
  # POST /revieweds.json
  def create
    @reviewed = Reviewed.new(reviewed_params)

    if !current_user.belongs_to_corral(@reviewed.gallina.id)
      redirect_to "/"
      return
    end

    if @reviewed.save
      redirect_to @reviewed.gallina
    else
      redirect_to "/"
    end
  end

  # PATCH/PUT /revieweds/1
  # PATCH/PUT /revieweds/1.json
  def update
    if !current_user.belongs_to_corral(@reviewed.gallina.id)
      redirect_to "/"
      return
    end

    if @reviewed.update(reviewed_params)
      redirect_to @reviewed.gallina
    else
      redirect_to "/"
    end
  end

  # DELETE /revieweds/1
  # DELETE /revieweds/1.json
  def destroy
    if !current_user.belongs_to_corral(@reviewed.gallina.id)
      redirect_to "/"
      return
    end

    @reviewed.destroy
    redirect_to "/"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_reviewed
      @reviewed = Reviewed.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reviewed_params
      params.require(:reviewed).permit(:name, :gallina_id)
    end
end
