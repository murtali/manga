class Permission

	def initialize(user)
		allow :users, [:new, :create]
		allow :sessions, [:new, :create, :destroy]
		allow [:mangas, :chapters, :pages], [:index, :show]
		if user
			allow :users, [:edit, :update]
			allow :mangas, [:rate]
			allow_all if user.admin?
		end
	end

	def allow?(controller, action)
		@allow_all || @allowed_actions[[controller, action]]
	end

	def allow(controllers, actions)
		@allowed_actions ||= {}
		# create controller and actions as Array to loop through
		Array(controllers).each do |controller|
			Array(actions).each do |action|
				# set the instance variable as a hash with the controller and action			
				# as keys that are set to true
				@allowed_actions[[controller.to_s, action.to_s]] = true
			end
		end
	end

	def allow_all
		@allow_all = true
	end

end