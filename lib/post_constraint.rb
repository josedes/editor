class PostConstraint     
  def matches?(request)
    'post' == Rails.cache.fetch("/view_controller_map/#{request.params[:view_name]}") { View.find_by_name(request.params[:view_name]).controller }
  end
end