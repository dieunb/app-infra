# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../../grpc_proto/lib/ruby', __dir__)
require 'Jobs_services_pb'

Gruf.configure do |c|
  c.server_binding_url = '0.0.0.0:9003'
  # The size of the underlying thread pool. No more concurrent requests can be made
  # than the size of the thread pool.
  c.rpc_server_options = c.rpc_server_options.merge(pool_size: 3)

  # interceptors configuration
  c.interceptors.use(
    Gruf::Interceptors::Instrumentation::RequestLogging::Interceptor,
    formatter: :logstash
  )
end

Gruf.logger = Logger.new($stdout)
Gruf.logger.level = Logger::Severity::DEBUG
Gruf.grpc_logger = Logger.new($stdout)
Gruf.grpc_logger.level = Logger::Severity::INFO
Gruf.services << ::Rpc::JobService::Service
