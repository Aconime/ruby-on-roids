require 'application_system_test_case'

class TeamRequestsTest < ApplicationSystemTestCase
  setup do
    @team_request = team_requests(:one)
  end

  test 'visiting the index' do
    visit team_requests_url
    assert_selector 'h1', text: 'Team requests'
  end

  test 'should create team request' do
    visit team_requests_url
    click_on 'New team request'

    click_on 'Create Team request'

    assert_text 'Team request was successfully created'
    click_on 'Back'
  end

  test 'should update Team request' do
    visit team_request_url(@team_request)
    click_on 'Edit this team request', match: :first

    click_on 'Update Team request'

    assert_text 'Team request was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Team request' do
    visit team_request_url(@team_request)
    click_on 'Destroy this team request', match: :first

    assert_text 'Team request was successfully destroyed'
  end
end
