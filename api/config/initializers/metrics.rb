require 'prometheus/client'

registry = Prometheus::Client.registry

vehicles = Prometheus::Client::Gauge.new(:vehicles, docstring: 'A count of Vehicles stored in the database')
registry.register(vehicles)

customers = Prometheus::Client::Gauge.new(:customers, docstring: 'A count of Customers stored in the database')
registry.register(customers)

users = Prometheus::Client::Gauge.new(:users, docstring: 'A count of Users stored in the database')
registry.register(users)

services = Prometheus::Client::Gauge.new(:services, docstring: 'A count of Services stored in the database')
registry.register(services)

gc_time = Prometheus::Client::Gauge.new(:gc_time, docstring: 'The total time in ms spent in garbage collections')
registry.register(gc_time)

gc_count = Prometheus::Client::Gauge.new(:gc_count, docstring: 'The total number of garbage collections since application start')
registry.register(gc_count)

gc_old = Prometheus::Client::Gauge.new(:gc_old, docstring: 'The number of live objects that have survived 3 garbage collections')
registry.register(gc_old)
