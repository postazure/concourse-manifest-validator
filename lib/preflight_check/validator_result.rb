class ValidatorResult
  attr_accessor :failed_jobs, :failed_resources

  def initialize(failed_jobs:, failed_resources:)
    @failed_jobs = failed_jobs
    @failed_resources = failed_resources
  end

  def success?
    failed_jobs.empty? && failed_resources.empty?
  end
end