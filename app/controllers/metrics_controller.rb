class MetricsController < ApplicationController
  before_action :set_metric, only: [:show, :edit, :update, :destroy]

  # GET /metrics
  # GET /metrics.json
  def index
    @metrics = Metric.all
  end

  # GET /metrics/1
  # GET /metrics/1.json
  def show
  end

  # GET /metrics/new
  def new
    @metric = Metric.new
  end

  # GET /metrics/1/edit
  def edit
  end

  # POST /metrics
  # POST /metrics.json
  def create
    @metric = Metric.new(metric_params)

    if !current_user.belongs_to_corral(@metric.corral.id)
      redirect_to "/"
      return
    end

    if @metric.save
      redirect_to @metric.corral
    else
      redirect_to "/"
    end
  end

  # PATCH/PUT /metrics/1
  # PATCH/PUT /metrics/1.json
  def update
    if !current_user.belongs_to_corral(@metric.corral.id)
      redirect_to "/"
      return
    end
    respond_to do |format|
      if @metric.update(metric_params)
        format.html { redirect_to @metric, notice: 'Metric was successfully updated.' }
        format.json { render :show, status: :ok, location: @metric }
      else
        format.html { render :edit }
        format.json { render json: @metric.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /metrics/1
  # DELETE /metrics/1.json
  def destroy
    if !current_user.belongs_to_corral(@metric.corral.id)
      redirect_to "/"
      return
    end
    @metric.destroy
    respond_to do |format|
      format.html { redirect_to metrics_url, notice: 'Metric was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_metric
      @metric = Metric.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def metric_params
      params.require(:metric).permit(:name, :description, :weight, :corral_id, :metric_type_id)
    end
end
