
require 'rails'

module ValidationEngine

	class Railtie < ::Rails::Railtie

		initializer 'activeservice.autoload', :before => :set_autoload_paths do |app|
			puts app.config.autoload_paths.inspect
    		app.config.autoload_paths << "app/validators"
  			puts app.config.autoload_paths.inspect
  		end


	end

end