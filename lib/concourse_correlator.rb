require_relative 'validator_result'

class ConcourseCorrelator
  def process_jobs(jobs:, resources:)
    jobs.each do |job|
      mark_missing_dependencies(job, resources)
    end

    failed_jobs = jobs.reject(&:success?)
    ValidatorResult.new(failed_jobs: failed_jobs)
  end

  def mark_missing_dependencies(job, resources)
    job.dependencies.each do |dep|
      if dep_is_defined_as_resource(dep, resources)
        dep.defined = true
      else
        job.mark_as_failed
        dep.defined = false
      end
    end
  end

  def dep_is_defined_as_resource(dep, resources)
    resources.find { |resource| resource.name == dep.name }
  end
end