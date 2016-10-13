# Papeel

## Setup

```bash
rails generate papeel:initializer
rails generate papeel:migration
rake db:migrate
```

In `config/initializer/papeel.rb`, whitelist your roles:
```ruby
Papeel.configure do |config|
  config.roles = [:super_admin, :admin]
end
```

```ruby
class User < ActiveRecord::Base
  include Papeel::ActsAsPapeelUser
  acts_as_papeel_user
end
```

```ruby
class Forum < ActiveRecord::Base
  include Papeel::ActsAsPapeelResource
  acts_as_papeel_resource
end
```

## What it does ?

### acts_as_papeel_user

#### instance methods

It adds a relation `has_many :roles` to the User class.

It adds a method named `has_role?` which work as follow:
```ruby
user = User.find(1)
Papeel::Role.create user: user, name: :admin
user.has_role? :admin
=> true

user.has_role? :admin, any: true
=> false

# =======================================
user = User.find(2)
forum = Forum.find(1)
Papeel::Role.create user: user, name: :admin, resource: forum
user.has_role? :admin
=> false

user.has_role? :admin, any: true
=> true

user.has_role? :admin, on: forum
=> true

user.has_role? :admin, on_type: "Forum"
=> true

user.has_role? :admin, on_type: "Forum", on_id: forum.id
=> true
```

it generates methods based on roles specified in papeel configuration, example:

```ruby
# config/initialize
Papeel.configure do |config|
  config.roles = [:super_admin, :admin]
end

# generates the following methods
user = User.find(1)
forum = Forum.find(1)

user.is_super_admin?
user.is_admin?
user.is_admin? on: forum
```

Those methods accept the same arguments as the `has_role?` method.

#### class methods

it adds scopes based on papeel configuration, example:

```ruby
User.super_admin 
# return users who are super_admin with AND without resource,
# chain a where clause if you want to be more specific

User.admin
# same but for admin role
```
