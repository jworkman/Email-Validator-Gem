module ValidationEngine
	class Engine < ::Rails::Engine


		config.autoload_paths << "#{config.root}/app/validators"


	end

end