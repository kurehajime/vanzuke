require 'json'
require 'net/https'
require "uri"
module Github
  extend ActiveSupport::Concern
  Author = Struct.new(:name, :total,:modify)
  
  def get_stats_contributors_ago(user,repo,start_time = 0)
    res_data = api_stats_contributors(user,repo)
    res_data.map do |commits|
      name = commits["author"]["login"]
      total = commits["total"]
      modify =commits["weeks"].inject(0) do |sum, week|
        if start_time <= week["w"] then
          sum += week["a"] + week["d"] + week["c"]
        end
        sum
      end
      Author.new(name,total,modify) if modify != 0
    end.compact
  end  

  private  

  def api_stats_contributors(user,repo)
    uri = URI("https://api.github.com/repos/#{user}/#{repo}/stats/contributors")
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    req = Net::HTTP::Get.new(uri)
    res = http.request(req)
    res_data=JSON.parse(res.body)
  end
end