# Concourse Manifest Validator
 
 Validates that you have defined all of the resources that your jobs are depending on.
 Validates that all declared resources are consumed.
 
 ![alt text](https://github.com/postazure/concourse-manifest-validator/blob/master/support/success_use_screenshot.png "Success Use")
 ![alt text](https://github.com/postazure/concourse-manifest-validator/blob/master/support/failure_use_screenshot.png "Failure Use")
 
### Run using command
`$ validate_manifest /path/to/file.yml`
 
 or
    
`$ ruby validate_manifest.rb /path/to/file.yml`
 


 
## Coming Soon
 1. Rename project/repo to 'preflight-check'
 1. Gem-ify
 1. Wrap concourse cli `fly` command to validate then run `fly`
 1. Check that tasks are defined
 1. Check concourse config file structure to ensure everything that is declared exists