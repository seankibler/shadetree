class ApplicationController < ActionController::API
  after_action :record_hit

  private

  def prometheus_registry
    Prometheus::Client.registry
  end

  def record_hit
    return if controller_name == 'metrics'
    metric = prometheus_registry.get("#{controller_name}_#{action_name}_hits")

    if metric.nil?
      logger.warn "No metric #{controller_name}_#{action_name}_hits registered for #{controller_name}##{action_name}!"
      metric = Prometheus::Client::Gauge.new("#{controller_name}_#{action_name}_hits".to_sym, docstring: "A count of hits on the #{controller_name} #{action_name} endpoint")
      prometheus_registry.register(metric)
    end

    metric.increment
  end
end
