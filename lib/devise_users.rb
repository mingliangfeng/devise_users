require "devise_users/engine"

module DeviseUsers
  mattr_reader :devise_resource_name
  @@devise_resource_name = 'user'
  def self.devise_resource_name=(resource_name)
    @@devise_resource_name = resource_name.to_s.singularize
  end

  mattr_reader :unauthorisation_url
  @@unauthorisation_url = '/'

  def self.setup
    yield self
  end
end
