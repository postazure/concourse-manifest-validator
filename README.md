# Concourse Manifest Validator
 
 Validates that you have defined all of the resources that your jobs are depending on.
 Validates that all declared resources are consumed.
 
### Run using command
`$ validate_manifest /path/to/file.yml`
 
 or
    
`$ ruby validate_manifest.rb /path/to/file.yml`
 
### Example Output


>Manifest at ./spec/support/yml_with_missing_resources.yml, is not valid.


>Job: build-jar-2, is missing cached-jar-2 

>Job: deploy-jar-2, is missing cached-jar-2

 
## Coming Soon
 
 1. Check that tasks are defined
 1. Check concourse config file structure to ensure everything that is declared exists