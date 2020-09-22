class Background
  attr_reader :id,
              :location,
              :image_url,
              :source

  def initialize(location, image_search_data)
    @location = location
    @image_url = image_search_data[:output_url]
    @source = 'https://deepai.org/machine-learning-model/text2img'
  end
end
