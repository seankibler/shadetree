class ApplicationController < ActionController::API
  after_action :record_hit
  before_action :authenticate!

  private
  
  def authenticate!
    if request.headers['Authorization'].blank?
      render status: :unauthorized

      return false
    end

    auth_token = request.headers['Authorization'].split(' ')[1]

    if !permitted_tokens.include?(auth_token)
      render status: :unauthorized

      return false
    end

    true
  end

  def permitted_tokens
    ENV['API_TOKENS'].split(',').map { |token| token.chomp }
  end

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
