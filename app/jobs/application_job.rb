class ApplicationJob < ActiveJob::Base
  class_attribute :logger, instance_writer: false

  self.logger = Logger.new(Rails.root.join('log/active_jobs.log'))
end
