require 'test_helper'

class TeamsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @team = teams(:one)
  end

  test 'should get index' do
    get _teams_url
    assert_response :success
  end

  test 'should get new' do
    get new__team_url
    assert_response :success
  end

  test 'should create team' do
    assert_difference('Team.count') do
      post _teams_url, params: { team: {} }
    end

    assert_redirected_to _team_url(Team.last)
  end

  test 'should show team' do
    get _team_url(@team)
    assert_response :success
  end

  test 'should get edit' do
    get edit__team_url(@team)
    assert_response :success
  end

  test 'should update team' do
    patch _team_url(@team), params: { team: {} }
    assert_redirected_to _team_url(@team)
  end

  test 'should destroy team' do
    assert_difference('Team.count', -1) do
      delete _team_url(@team)
    end

    assert_redirected_to _teams_url
  end
end
