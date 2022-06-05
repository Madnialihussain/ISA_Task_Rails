# config/initializers/good_job.rb
GoodJob.active_record_parent_class = "ApplicationRecord"
GoodJob.preserve_job_records = true
GoodJob.retry_on_unhandled_error = false
GoodJob.on_thread_error = -> (exception) { Raven.capture_exception(exception) }