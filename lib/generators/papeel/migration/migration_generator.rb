require 'rails/generators/active_record'

module Papeel
  module Generators
    class MigrationGenerator < ActiveRecord::Generators::Base
      source_root File.expand_path("../templates", __FILE__)

      argument :name, :type => :string, :default => 'create_roles'

      def generate_files
        migration_template "migration.rb", "db/migrate/papeel_create_roles.rb"
      end
    end
  end
end
