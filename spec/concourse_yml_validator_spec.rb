describe ConcourseYmlValidator do
  context 'when jobs have all their resources' do
    let(:path_to_manifest) { File.join(File.dirname(__FILE__), 'support/yml_with_balanced_resources.yml') }

    it 'should return a ValidatorResult' do
      validator_result = subject.validate(path: path_to_manifest)
      expect(validator_result).to be_a ValidatorResult
    end

    it 'should validate that all the "resources" exist for all the "jobs"' do
      validator_result = subject.validate(path: path_to_manifest)
      expect(validator_result.success?).to be true
    end
  end

  context 'when jobs are missing resources' do
    let(:path_to_manifest) { File.join(File.dirname(__FILE__), 'support/yml_with_missing_resources.yml') }

    it 'should validate that all the "resources" exist for all the "jobs"' do
      validator_result = subject.validate(path: path_to_manifest)
      expect(validator_result.success?).to be false
    end

    it 'should have a result failed jobs with their missing deps marked' do
      validator_result = subject.validate(path: path_to_manifest)

      expect(validator_result.failed_jobs.size).to eq 2
      expect(validator_result.failed_jobs.map(&:name)).to contain_exactly('build-jar-2', 'deploy-jar-2')
      expect(validator_result.failed_jobs[0].missing_dependencies.first.name).to eq 'cached-jar-2'
      expect(validator_result.failed_jobs[1].missing_dependencies.first.name).to eq 'cached-jar-2'
    end
  end

  context 'when there are extra resources defined' do
    let(:path_to_manifest) { File.join(File.dirname(__FILE__), 'support/yml_with_extra_resources.yml') }

    it 'should fail because there are resources that are defined and not used' do
      validator_result = subject.validate(path: path_to_manifest)
      expect(validator_result.success?).to be false
    end

    it 'should have a result that includes extra resources' do
      validator_result = subject.validate(path: path_to_manifest)

      expect(validator_result.failed_resources.size).to eq 1
      failed_resource = validator_result.failed_resources.first
      expect(failed_resource.name).to eq 'extra-resource'
    end
  end
end