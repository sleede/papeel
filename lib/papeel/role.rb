module Papeel
  class Role < ActiveRecord::Base
    self.table_name = "papeel_roles"

    belongs_to :user, required: true
    belongs_to :resource, polymorphic: true

    validates :name, presence: true
    validates :name, inclusion: { in: proc { Papeel.config.roles.map(&:to_s) } }

    validates :name, uniqueness: { scope: [:user_id, :resource_type, :resource_id] }

    scope :named, ->(name) { where(name: name) }
    scope :on, ->(resource) { where(resource: resource) }
  end
end
