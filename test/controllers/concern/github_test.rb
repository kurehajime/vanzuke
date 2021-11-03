require "test_helper"

class GithubTest < ActionDispatch::IntegrationTest
  class Temp
    include Github 
  end

  test "get stats contributors" do
    t = Temp.new

    # All contributions => 0
    authors = t.get_stats_contributors_ago("kurehajime","vanzuke",0)
    assert (authors.count >= 0)

    # Only future contributions == 0 
    authors = t.get_stats_contributors_ago("kurehajime","vanzuke",Time.now.to_i + 1000000000)
    assert (authors.count == 0)
  end

end