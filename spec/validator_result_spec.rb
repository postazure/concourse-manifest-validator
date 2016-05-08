describe ValidatorResult do
  let(:a_resource) { ConcourseResource.new(name: 'foo') }

  let( :failed_job ) do
    ConcourseJob.new(
        name: 'failed job', dependencies: [ConcourseJobDependency.new(name: 'not defined')]
    )
  end

  describe '#success?' do
    it 'should return true when there are no failed jobs' do
      result = ValidatorResult.new(failed_jobs: [], failed_resources: [])
      expect(result).to be_success
    end

    it 'should return false when there are failed jobs' do
      result = ValidatorResult.new(failed_jobs: [failed_job], failed_resources: [])
      expect(result).to_not be_success
    end

    it 'should return false when there are failed resources' do
      result = ValidatorResult.new(failed_jobs: [], failed_resources: [a_resource])
      expect(result).to_not be_success
    end

    it 'should return false when there are both failed resources and failed jobs' do
      result = ValidatorResult.new(failed_jobs: [failed_job], failed_resources: [a_resource])
      expect(result).to_not be_success
    end
  end

  describe '#failed_jobs' do
    it 'should return a list of all jobs that are missing dependencies' do
      result = ValidatorResult.new(failed_jobs: [failed_job], failed_resources: [])

      expect(result.failed_jobs).to contain_exactly failed_job
    end
  end
end