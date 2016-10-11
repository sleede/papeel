module Papeel
  module ActsAsPapeelResource
    extend ActiveSupport::Concern

    included do
    end

    module ClassMethods
      def acts_as_papeel_resource
        include Papeel::ActsAsPapeelResource::LocalInstanceMethods

        class_eval do
          has_many :roles_as_resource, as: :resource, dependent: :destroy, class_name: "Papeel::Role"
        end
      end
    end

    module LocalInstanceMethods
    end
  end
end
