require 'rails/generators/active_record'

module Papeel
  module Generators
    class InitializerGenerator < ActiveRecord::Generators::Base
      source_root File.expand_path("../templates", __FILE__)

      argument :name, :type => :string, :default => 'copy'

      def generate_files
        template "initializer.rb", "config/initializers/papeel.rb"
      end
    end
  end
end
