# Puppet Lint All Strings Double Quoted Check

Puppet Lint All Strings Double Quoted Check tests Puppet code for file ressources that are missing Owner, group or mode settings. 


## Installation

Install the Puppet Lint gem by running:

```
gem install --local puppet-lint-all_strings_double_quoted-check-1.0.0.gem
```

## Testing with Puppet Lint

To test manifests for correct Puppet style, run the `puppet-lint` command with the path to the files you want to test.

For example:

```
puppet-lint ~/modules/puppetlabs-java/manifests/init.pp
```

```
puppet-lint ~/modules/puppetlabs-mysql/manifests
```

#### Disable checks within Puppet code

To disable checks from within your Puppet code itself, use [control comments](http://puppet-lint.com/controlcomments/). Disable checks on either a per-line or per-block basis using `#lint:ignore:<check_name>`.

For example:

```puppet
  # lint:ignore:all_strings_double_quoted
  file { 'foo':
    ensure => 'present',
  }
  # lint:all_strings_double_quoted
```


###Build / Dev requirements
To start developing on this custom check, install the necessary gems inside of the git root folder with the following command:

```
bundle install --path vendor/gems
```

###Testing the module
Run the tests with the following command:

```
bundle exec rake
```

###Building the gem
Make sure that you increase the version number in puppet-lint-all_strings_double_quoted-check.gemspec file, before you build a new version of the gem.
Build the gem with the following command:

```
gem build puppet-lint-all_strings_double_quoted-check.gemspec
```
