class ConcourseJob
  attr_accessor :name, :dependencies
  def initialize(name:, dependencies:)
    @name = name
    @dependencies = dependencies
    @success = true
  end

  def mark_as_failed
    @success = false
  end

  def success?
    @success
  end

  def missing_dependencies
    dependencies.reject(&:defined?)
  end
end