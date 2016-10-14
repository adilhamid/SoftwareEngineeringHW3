class Movie < ActiveRecord::Base
	def self.getmovies(filters, sort_by)
	return self.order(sort_by) if not filters
	self.where({:rating => filters.keys}).order(sort_by)
	end

	def self.all_ratings
	     self.pluck(:rating).uniq
	end
end
