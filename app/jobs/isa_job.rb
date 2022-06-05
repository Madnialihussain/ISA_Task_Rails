class IsaJob < ApplicationJob
    def perform(movie_names, job_id)
      movie_names.each { |name| Movie.create(name: name)  }
    end
  end
  