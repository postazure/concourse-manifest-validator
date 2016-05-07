describe ConcourseJobFactory do
  describe '#build' do

    context 'when "get"' do
      let(:jobs_yml) do
        <<-YML
jobs:
- name: build-jar-1
  plan:
    - get: ci-config-repo
      trigger: true
        YML
      end
      it 'should build' do
        job = subject.build(YAML.load(jobs_yml)['jobs'].first)

        expect(job.name).to eq 'build-jar-1'

        resource = job.dependencies.first
        expect(resource.name).to eq 'ci-config-repo'
      end
    end

    context 'when "put"' do
      let(:jobs_yml) do
        <<-YML
jobs:
- name: build-jar-1
  plan:
    - put: ci-config-repo
      trigger: true
        YML
      end

      it 'should build' do
        job = subject.build(YAML.load(jobs_yml)['jobs'].first)

        expect(job.name).to eq 'build-jar-1'

        resource = job.dependencies.first
        expect(resource.name).to eq 'ci-config-repo'
      end
    end
  end
end
