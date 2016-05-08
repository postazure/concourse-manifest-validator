# PreflightCheck

Validates that you have defined all of the resources that your jobs are depending on.
Validates that all declared resources are consumed.
 
 ![alt text](https://github.com/postazure/preflight_check/blob/master/support/success_use_screenshot.png "Success Use")
 ![alt text](https://github.com/postazure/preflight_check/blob/master/support/failure_use_screenshot.png "Failure Use")

## Installation

install it as:

    $ gem install preflight_check

### Usage

    $ preflight_check /path/to/config_file.yml   
 
## Contributing

1. Fork it ( https://github.com/[my-github-username]/preflight_check/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

 
## Coming Soon
 1. Wrap concourse cli `fly` command to validate then run `fly`
 1. Check that tasks are defined
 1. Check concourse config file structure to ensure everything that is declared exists