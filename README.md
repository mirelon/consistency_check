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

Usage with ActiveAdmin:

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

Bug reports and pull requests are welcome on GitHub at https://github.com/mirelon/consistency_check.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the ConsistencyCheck project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/mirelon/consistency_check/blob/master/CODE_OF_CONDUCT.md).
