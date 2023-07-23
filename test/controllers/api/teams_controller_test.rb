require "test_helper"

class Api::TeamsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @team = teams(:one)
  end

  test "should get index" do
    get api_teams_url
    assert_response :success
  end

  test "should get new" do
    get new_api_team_url
    assert_response :success
  end

  test "should create team" do
    assert_difference("Team.count") do
      post api_teams_url, params: { team: {  } }
    end

    assert_redirected_to api_team_url(Team.last)
  end

  test "should show team" do
    get api_team_url(@team)
    assert_response :success
  end

  test "should get edit" do
    get edit_api_team_url(@team)
    assert_response :success
  end

  test "should update team" do
    patch api_team_url(@team), params: { team: {  } }
    assert_redirected_to api_team_url(@team)
  end

  test "should destroy team" do
    assert_difference("Team.count", -1) do
      delete api_team_url(@team)
    end

    assert_redirected_to api_teams_url
  end
end
