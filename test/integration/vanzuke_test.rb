require 'test_helper'

class VanzukeTest < ActionDispatch::IntegrationTest
  test "make" do
    get "/"
    assert_includes response.body , "vanzuke"

    get "/make"
    assert_includes response.body , "vanzuke"
  end

  test "ranks" do
    get "/ranks?repo=kurehajime/vanzuke&count=5&years=0&month=0&days=0&title=hello"
    assert_includes response.body , "hello"
  end
end