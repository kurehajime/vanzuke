require "test_helper"

class RanksControllerTest < ActionDispatch::IntegrationTest
    test "should get index" do
        get "/ranks", params: {repo: "kurehajime/colamone_js"}
        assert_response :success
    end
end
