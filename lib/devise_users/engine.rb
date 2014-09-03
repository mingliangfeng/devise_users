module DeviseUsers
  class Engine < ::Rails::Engine
    require 'jquery-rails'
    require 'coffee-rails'
    isolate_namespace DeviseUsers
  end
end
