class ServicesController < ApplicationController
  before_action :set_service, only: %i[ show update destroy ]

  # GET /services
  # GET /services.json
  def index
    @services = Service.all
  end

  # GET /services/1
  # GET /services/1.json
  def show
  end

  # POST /services
  # POST /services.json
  def create
    @service = Service.new(service_params)

    if @service.save
      render :show, status: :created, location: @service
    else
      render json: @service.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /services/1
  # PATCH/PUT /services/1.json
  def update
    if @service.update(service_params)
      render :show, status: :ok, location: @service
    else
      render json: @service.errors, status: :unprocessable_entity
    end
  end

  # DELETE /services/1
  # DELETE /services/1.json
  def destroy
    @service.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_service
      @service = Service.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def service_params
      params.require(:service).permit(:name, :description, :type, :interval_miles, :interval_days)
    end
end
