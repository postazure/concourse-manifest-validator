require "preflight_check/version"
require_relative '../lib/preflight_check/concourse_yml_validator'

module PreflightCheck
  class Validator < ConcourseYmlValidator
  end
end
