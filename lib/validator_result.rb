class ValidatorResult
  attr_accessor :failed_jobs

  def initialize(failed_jobs:)
    @failed_jobs = failed_jobs
  end

  def success?
    failed_jobs.empty?
  end
end