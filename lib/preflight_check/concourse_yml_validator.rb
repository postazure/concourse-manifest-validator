require 'yaml'
require_relative 'concourse_resource'
require_relative 'concourse_job_factory'
require_relative 'concourse_correlator'


class ConcourseYmlValidator
  def validate(path:)
    yml_info = read_yml_file(path)
    resources = init_resources(yml_info['resources'])
    jobs = init_job(yml_info['jobs'])

    correlator = ConcourseCorrelator.new
    correlator.process_jobs(jobs: jobs, resources: resources)
  end

  private
  def read_yml_file(path)
    file = File.open(path, 'r')
    contents = file.read
    file.close

    YAML.load(contents)
  end

  def init_resources(yaml_resources)
    yaml_resources.map do |resource|
      ConcourseResource.new(name: resource['name'])
    end
  end

  def init_job(yaml_job)
    yaml_job.map do |job|
      ConcourseJobFactory.new.build(job)
    end
  end
end