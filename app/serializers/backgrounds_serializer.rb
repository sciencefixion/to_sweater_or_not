class BackgroundsSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :location, :image_url, :source
end
