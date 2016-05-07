require_relative 'concourse_job'
require_relative 'concourse_job_dependency'

class ConcourseJobFactory
  def build(job_info)
    dependencies = []
    job_info['plan'].each do |dependency|
      name = dependency['get'] || dependency['put']
      dependencies << ConcourseJobDependency.new(name: name) unless name.nil?
    end
    ConcourseJob.new(name: job_info['name'], dependencies: dependencies)
  end
end