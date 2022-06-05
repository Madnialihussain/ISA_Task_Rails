class LowPriorityJob < ApplicationJob

  def perform(*args)
    # binding.pry
    # job_id = args[0]
    # @job = Job.find(job_id)
    # @job.update(status: "completed")
    params = args[0]
    binding.pry

    args[0].each { |name| Movie.create(movie_name: name)  }
  end

end
