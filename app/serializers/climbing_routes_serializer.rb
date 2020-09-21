require 'fast_jsonapi'

class ClimbingRoutesSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :location, :forecast, :routes
end
