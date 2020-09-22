class ClimbingRoutesSerializer
  include FastJsonapi::ObjectSerializer
  attributes :location, :forecast, :routes
end
