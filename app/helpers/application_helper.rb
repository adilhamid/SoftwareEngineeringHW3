module ApplicationHelper
	def sort_class(sort_column)
	params[:sort_by] == sort_column ? "hilite" : ""	
	end

end
