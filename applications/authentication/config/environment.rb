# frozen_string_literal: true

require 'bundler/setup'

ENV['APP_ENV'] ||= 'development'
app_env = ENV['APP_ENV']

Bundler.require(:default, app_env.to_sym)
# Bundler.setup(:default, app_env.to_sym)

require_relative 'grpc_gruf'
