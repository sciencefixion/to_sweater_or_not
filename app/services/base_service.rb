class BaseService
  def self.json(response)
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn(url)
    Faraday.new(url)
  end
end
