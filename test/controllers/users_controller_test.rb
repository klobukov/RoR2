require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest

	def setup
		@base_title = "SampleApp"
	end

  test "should get new" do
    get signup_url
    assert_response :success
    assert_select 'title', "Sign up | #{@base_title}"
  end

end
