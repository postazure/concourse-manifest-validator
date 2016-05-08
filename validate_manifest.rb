#!/usr/bin/env ruby

require_relative './lib/concourse_yml_validator'

path = ARGV.first
if path.nil? || path.empty?
  puts 'Include path to yml as command line argument.'
  puts 'ie. $ validate_manifest /path/to/file.yml'
  exit
end

concourse_yml_validator = ConcourseYmlValidator.new
result = concourse_yml_validator.validate(path: path)

puts "Manifest at #{path}, is#{' not' unless result.success?} valid."


def print_failed_jobs(result)
  puts '--Missing Dependencies--'
  result.failed_jobs.each do |job|
    job.missing_dependencies.each do |dep|
      puts "Job: '#{job.name}', is missing resource: #{dep.name}"
    end
  end
end

def print_failed_resources(result)
  puts '--Unused Resources Declared--'
  result.failed_resources.each do |resource|
    puts "Resource: '#{resource.name}' was defined, but never used."
  end
end

if !result.success?
  print_failed_jobs(result) unless result.failed_jobs.empty?

  print_failed_resources(result) unless result.failed_resources.empty?
end