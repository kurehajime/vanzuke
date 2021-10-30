require "test_helper"

class GithubTest < ActionDispatch::IntegrationTest
  class Temp
    include Github 
  end

  test "get stats contributors" do
    t = Temp.new
    authors = t.get_stats_contributors("kurehajime","vanzuke")
    assert (authors.count >= 0)
  end

end