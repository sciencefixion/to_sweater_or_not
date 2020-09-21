class DeepaiService < BaseService
  def self.get_image(keywords)
    response = deep_conn.post('/api/text2img') do |req|
      req.params['text'] = keywords
    end
    json(response)
  end

  class << self
    private

    def deep_conn
      Faraday.new('https://api.deepai.org') do |faraday|
        faraday.headers['api-key'] = ENV['DEEPAI_API_KEY']
      end
    end
  end
end
