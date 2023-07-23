require 'test_helper'

class Api::TeamRequestsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @team_request = team_requests(:one)
  end

  test 'should get index' do
    get api_team_requests_url
    assert_response :success
  end

  test 'should get new' do
    get new_api_team_request_url
    assert_response :success
  end

  test 'should create team_request' do
    assert_difference('TeamRequest.count') do
      post api_team_requests_url, params: { team_request: {} }
    end

    assert_redirected_to api_team_request_url(TeamRequest.last)
  end

  test 'should show team_request' do
    get api_team_request_url(@team_request)
    assert_response :success
  end

  test 'should get edit' do
    get edit_api_team_request_url(@team_request)
    assert_response :success
  end

  test 'should update team_request' do
    patch api_team_request_url(@team_request), params: { team_request: {} }
    assert_redirected_to api_team_request_url(@team_request)
  end

  test 'should destroy team_request' do
    assert_difference('TeamRequest.count', -1) do
      delete api_team_request_url(@team_request)
    end

    assert_redirected_to api_team_requests_url
  end
end
