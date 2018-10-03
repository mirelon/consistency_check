require 'rails/generators'
require 'rails/generators/migration'

module ConsistencyCheck
  module Generators
    class InstallGenerator < Rails::Generators::Base
      include Rails::Generators::Migration
      desc "Installs consistency_check and generates the necessary migrations"

      source_root File.expand_path('../templates', __FILE__)

      def self.next_migration_number(path)
        next_migration_number = current_migration_number(path) + 1
        ActiveRecord::Migration.next_migration_number(next_migration_number)
      end

      def create_migrations
        migration_template 'migrations/create_consistency_check_results.rb.erb', 'db/migrate/create_consistency_check_results.rb'
      end

      def create_model
        fname = 'app/models/consistency_check_result.rb'
        template('models/consistency_check_result.rb.erb', fname)
      end

      def create_job
        fname = 'app/jobs/consistency_check/definitions.rb'
        template('jobs/consistency_check/definitions.rb.erb', fname)
      end
    end
  end
end
