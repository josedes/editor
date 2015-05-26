class DynamicRouteConstraint < Struct.new
  def matches?(request)
    User.find_by_first_name(request.params[:route]).present?
  end
end