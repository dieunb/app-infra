# frozen_string_literal: true

module Rpc
  class JobsController < ::Gruf::Controllers::Base
    bind ::Rpc::JobService::Service

    ##
    # @return [Demo::GetJobResp] The job response
    #
    def get_job
      # job = ::Job.find(request.message.id)
      job_id = 1
      Rpc::GetJobResp.new(id: job_id)
    rescue StandardError => _e
      fail!(:not_found, :job_not_found, "Failed to find Job with ID: #{request.message.id}")
    end
  end
end
