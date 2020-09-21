require 'rails_helper'

RSpec.describe 'DeepAI Service' do
  it "can make an api call to deepai", :vcr do
    data = [:id, :output_url]
    keywords = 'strawberry'

    service = DeepaiService.get_image(keywords)
    data.each do |d|
      expect(service.keys.include?(d)).to eq(true)
    end
  end
end
