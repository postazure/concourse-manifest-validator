require_relative 'validator_result'

class ConcourseCorrelator
  def process_jobs(jobs:, resources:)

    jobs.each { |job| mark_missing_dependencies(job, resources) }

    used_resources = build_utilized_resource_list(jobs)

    failed_resources = []
    resources.each do |resource|
      consumed_resource = used_resources.find do |used_resource_name|
        used_resource_name == resource.name
      end
      if consumed_resource.nil?
        failed_resources << resource
      end
    end

    failed_jobs = jobs.reject(&:success?)
    ValidatorResult.new(failed_jobs: failed_jobs, failed_resources: failed_resources)
  end

  def build_utilized_resource_list(jobs)
    utilized_resource_names = []
    jobs.each do |job|
      job.dependencies.each do |dep|
        utilized_resource_names << dep.name
      end
    end
    utilized_resource_names
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