require "test_helper"

class VehiclesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @vehicle = vehicles(:one)
  end

  test "should get index" do
    get vehicles_url, as: :json
    assert_response :success
  end

  test "should create vehicle" do
    assert_difference("Vehicle.count") do
      post vehicles_url, params: { vehicle: { color: @vehicle.color, customer_id: @vehicle.customer_id, make_id: @vehicle.make_id, miles: @vehicle.miles, model_id: @vehicle.model_id, name: @vehicle.name, type: @vehicle.type, vin: @vehicle.vin, year: @vehicle.year } }, as: :json
    end

    assert_response :created
  end

  test "should show vehicle" do
    get vehicle_url(@vehicle), as: :json
    assert_response :success
  end

  test "should update vehicle" do
    patch vehicle_url(@vehicle), params: { vehicle: { color: @vehicle.color, customer_id: @vehicle.customer_id, make_id: @vehicle.make_id, miles: @vehicle.miles, model_id: @vehicle.model_id, name: @vehicle.name, type: @vehicle.type, vin: @vehicle.vin, year: @vehicle.year } }, as: :json
    assert_response :success
  end

  test "should destroy vehicle" do
    assert_difference("Vehicle.count", -1) do
      delete vehicle_url(@vehicle), as: :json
    end

    assert_response :no_content
  end
end
