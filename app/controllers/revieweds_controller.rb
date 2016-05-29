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

    respond_to do |format|
      if @reviewed.save
        format.html { redirect_to @reviewed, notice: 'Reviewed was successfully created.' }
        format.json { render :show, status: :created, location: @reviewed }
      else
        format.html { render :new }
        format.json { render json: @reviewed.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /revieweds/1
  # PATCH/PUT /revieweds/1.json
  def update
    respond_to do |format|
      if @reviewed.update(reviewed_params)
        format.html { redirect_to @reviewed, notice: 'Reviewed was successfully updated.' }
        format.json { render :show, status: :ok, location: @reviewed }
      else
        format.html { render :edit }
        format.json { render json: @reviewed.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /revieweds/1
  # DELETE /revieweds/1.json
  def destroy
    @reviewed.destroy
    respond_to do |format|
      format.html { redirect_to revieweds_url, notice: 'Reviewed was successfully destroyed.' }
      format.json { head :no_content }
    end
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
