# Generated by the protocol buffer compiler.  DO NOT EDIT!
# Source: Jobs.proto for package 'rpc'

require 'grpc'
require 'Jobs_pb'

module Rpc
  module JobService
    class Service

      include GRPC::GenericService

      self.marshal_class_method = :encode
      self.unmarshal_class_method = :decode
      self.service_name = 'rpc.JobService'

      rpc :GetJob, ::Rpc::GetJobReq, ::Rpc::GetJobResp
    end

    Stub = Service.rpc_stub_class
  end
end