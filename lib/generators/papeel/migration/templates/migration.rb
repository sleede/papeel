class PapeelCreateRoles < ActiveRecord::Migration
  def change
    create_table :papeel_roles do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.string :name
      t.belongs_to :resource, polymorphic: true, index: true
      t.timestamps null: false
    end

    add_index :roles, :name
    add_index :roles, [:user_id, :name]
    add_index :roles, [:resource_type, :resource_id, :name]
  end
end
