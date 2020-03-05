require 'test_helper'

class Accounts::BookingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get accounts_bookings_index_url
    assert_response :success
  end

end
