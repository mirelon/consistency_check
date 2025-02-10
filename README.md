[![Gem Version](https://badge.fury.io/rb/consistency_check.svg)](https://badge.fury.io/rb/consistency_check)


# ConsistencyCheck

Run your own consistency checks and store results (time, name of the check, consisitency violations) in DB.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'consistency_check'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install consistency_check
    
Then run generators, which create a migration, model and dummy consistency check definitions:

    $ rails g consistency_check:install
    
And migrations:

    $ rails db:migrate

## Usage

Write your own consistency check definitions into the file `jobs/consistency_check/definitions.rb` and run

    $ ConsistencyCheck.run_all

Usage with [ActiveAdmin](https://github.com/activeadmin/activeadmin)

```
ActiveAdmin.register ConsistencyCheckResult do
  actions :index

  action_item :run do
    link_to 'Run all consistency checks', run_admin_consistency_check_results_path
  end

  collection_action :run do
    ConsistencyCheck.run_all.map(&:save)
    redirect_to admin_consistency_check_results_path
  end
end
```

## Contributing

After making changes, do not forget to bump the version in `version.rb`. Then:
```bash
$ gem build consistency_check.gemspec
Successfully built RubyGem
Name: consistency_check
Version: 0.3.0
File: consistency_check-0.3.0.gem
$ gem install consistency_check
```
When testing locally in a rails app, add this to `Gemfile`:
```ruby
gem 'consistency_check', path: '~/.rvm/gems/ruby-3.4.1@consistency_check/gems/consistency_check-0.4.0/'
```
When testing ends, run:
```bash
$ gem push consistency_check-0.4.0.gem
```
and remove `path` argument from rails app's Gemfile.

Bug reports and pull requests are welcome on GitHub at https://github.com/mirelon/consistency_check.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the ConsistencyCheck project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/mirelon/consistency_check/blob/master/CODE_OF_CONDUCT.md).
