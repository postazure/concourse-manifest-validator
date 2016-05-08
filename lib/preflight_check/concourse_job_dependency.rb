class ConcourseJobDependency
  attr_accessor :name
  def initialize(name:)
    @name = name
    @is_defined = nil
  end

  def defined= value
    @is_defined = value
  end

  def defined?
    @is_defined
  end
end