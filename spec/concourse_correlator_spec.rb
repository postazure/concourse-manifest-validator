describe ConcourseCorrelator do
  let(:job_list) { [ConcourseJob.new(name: 'foo_job', dependencies: [ConcourseJobDependency.new(name: 'bar_resource')])] }

  describe '#proccess_jobs' do

    context 'when jobs and resources match' do
      let(:resource_list) { [ConcourseResource.new(name: 'bar_resource')] }

      it 'should ensure that each job has all the dependencies that it specifies' do
        expect(subject.process_jobs(jobs: job_list, resources: resource_list)).to be_a ValidatorResult
      end
    end

    context 'when resources are missing' do
      let(:resource_list) { [] }

      it 'should ensure that each job has all the dependencies that it specifies' do
        result = subject.process_jobs(jobs: job_list, resources: resource_list)
        expect(result.success?).to be false

        job = result.failed_jobs.first
        expect(job.name).to eq 'foo_job'

        missing_dep = job.missing_dependencies.first
        expect(missing_dep.name).to eq 'bar_resource'
      end
    end
  end
end