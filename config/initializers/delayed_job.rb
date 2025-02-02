# frozen_string_literal: true

require 'delayed_job/fill_provider_job_id'
require 'delayed_job/unique_name'
require 'prometheus_config'

if PrometheusConfig.enabled?
  require 'delayed_job/prometheus_plugin'
end

if Rails.env.development?
  require 'delayed_job/dev_no_daemon'
end

Delayed::Worker.destroy_failed_jobs = false
Delayed::Worker.read_ahead = 1
