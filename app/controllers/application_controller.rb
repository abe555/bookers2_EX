class ApplicationController < ActionController::Base

	def after_sign_in_path_for(resource)
		show_user_path(resource)
	end

end

