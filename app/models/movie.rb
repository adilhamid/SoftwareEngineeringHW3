class Movie < ActiveRecord::Base
	def self.getmovies(filters, sort_by)
	return self.order(sort_by) if not filters
	self.where({:rating => filters}).order(sort_by)
	end

	def self.all_ratings
	     self.pluck(:rating).uniq
	end

	def self.set_options(params, session)
		setup = { :redirect => false }
		setup[:ratings] = if params[:ratings]
			if params[:ratings].kind_of? Hash 
				params[:ratings].keys
			else
				params[:ratings]
			end

		elsif session[:ratings]
			setup[ :redirect] = true
			session[:ratings]
		else
			self.all_ratings
		end

		setup[:sort_by] = if params[:sort_by]
			params[:sort_by]
		elsif session[:sort_by]
			setup[ :redirect] = true
			session[:sort_by]
		else
			nil #'title'
		end

		setup

			
	end

end
