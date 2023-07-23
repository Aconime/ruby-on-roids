require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @event = events(:one)
  end

  test 'should get index' do
    get _events_url
    assert_response :success
  end

  test 'should get new' do
    get new__event_url
    assert_response :success
  end

  test 'should create event' do
    assert_difference('Event.count') do
      post _events_url, params: { event: {} }
    end

    assert_redirected_to _event_url(Event.last)
  end

  test 'should show event' do
    get _event_url(@event)
    assert_response :success
  end

  test 'should get edit' do
    get edit__event_url(@event)
    assert_response :success
  end

  test 'should update event' do
    patch _event_url(@event), params: { event: {} }
    assert_redirected_to _event_url(@event)
  end

  test 'should destroy event' do
    assert_difference('Event.count', -1) do
      delete _event_url(@event)
    end

    assert_redirected_to _events_url
  end
end
