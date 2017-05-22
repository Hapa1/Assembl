module ClasspagesHelper

	def current_classpage
    	@current_classpage ||= Classpage.find_by(id: classpage_id)
  end
end
