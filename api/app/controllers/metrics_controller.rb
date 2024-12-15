require 'prometheus/client'
require 'prometheus/client/formats/text'

class MetricsController < ApplicationController

  def index
    @registry = Prometheus::Client.registry

    gc_stats = GC.stat
    @registry.get(:vehicles)&.set(Vehicle.count)
    @registry.get(:customers)&.set(Customer.count)
    @registry.get(:users)&.set(User.count)
    @registry.get(:services)&.set(Service.count)
    @registry.get(:gc_count)&.set(gc_stats[:count])
    @registry.get(:gc_time)&.set(gc_stats[:time])
    @registry.get(:gc_old)&.set(gc_stats[:old_objects])

    render plain: Prometheus::Client::Formats::Text.marshal(@registry)
  end
end
