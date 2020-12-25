# frozen_string_literal: true

require 'bundler/setup'

ENV['APP_ENV'] ||= 'development'
app_env = ENV['APP_ENV']

Bundler.require(:default, app_env.to_sym)
# Bundler.setup(:default, app_env.to_sym)

$LOAD_PATH.unshift File.expand_path('../../grpc_proto/lib/ruby', __dir__)

require 'Jobs_services_pb'
require_relative 'grpc_gruf'
