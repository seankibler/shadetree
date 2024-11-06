class VehiclesController < ApplicationController
  before_action :set_vehicle, only: %i[ show update destroy ]

  # GET /vehicles
  # GET /vehicles.json
  def index
    @vehicles = Vehicle.all
  end

  # GET /vehicles/1
  # GET /vehicles/1.json
  def show
  end

  # POST /vehicles
  # POST /vehicles.json
  def create
    @vehicle = Vehicle.new(vehicle_params)

    if @vehicle.save
      render :show, status: :created, location: @vehicle
    else
      render json: @vehicle.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /vehicles/1
  # PATCH/PUT /vehicles/1.json
  def update
    if @vehicle.update(vehicle_params)
      render :show, status: :ok, location: @vehicle
    else
      render json: @vehicle.errors, status: :unprocessable_entity
    end
  end

  # DELETE /vehicles/1
  # DELETE /vehicles/1.json
  def destroy
    @vehicle.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vehicle
      @vehicle = Vehicle.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def vehicle_params
      params.require(:vehicle).permit(:name, :type, :make_id, :model_id, :year, :vin, :miles, :color, :customer_id)
    end
end
