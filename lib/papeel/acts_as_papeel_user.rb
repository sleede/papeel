module Papeel
  module ActsAsPapeelUser
    extend ActiveSupport::Concern

    included do
    end

    module ClassMethods
      def acts_as_papeel_user
        include Papeel::ActsAsPapeelUser::LocalInstanceMethods

        class_eval do
          has_many :roles, class_name: "Papeel::Role", dependent: :destroy, inverse_of: :user
        end

        Papeel.config.roles.each do |role|
          define_method "is_#{role}?" do |opts = {}|
            has_role? role, opts
          end
        end

        Papeel.config.roles.each do |role|
          class_eval do
            scope role, -> { joins(:roles).where(papeel_roles: { name: role }) }
          end
        end
      end
    end

    module LocalInstanceMethods
      def has_role?(role_name, any: nil, on: nil, on_type: nil, on_id: nil)
        if on_type
          _roles = roles.named(role_name).where(resource_type: on_type)
          if on_id
            _roles = _roles.where(resource_id: on_id)
          end
          _roles.any?
        else
          if on
            roles.named(role_name).on(on).any?
          else
            if any == nil
              roles.named(role_name).where(resource_id: nil, resource_type: nil).any?
            elsif any == true
              roles.named(role_name).where.not(resource_id: nil, resource_type: nil).any?
            end
          end
        end
      end
    end
  end
end
