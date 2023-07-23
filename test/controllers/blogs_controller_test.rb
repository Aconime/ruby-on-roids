require 'test_helper'

class BlogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @blog = blogs(:one)
  end

  test 'should get index' do
    get _blogs_url
    assert_response :success
  end

  test 'should get new' do
    get new__blog_url
    assert_response :success
  end

  test 'should create blog' do
    assert_difference('Blog.count') do
      post _blogs_url, params: { blog: {} }
    end

    assert_redirected_to _blog_url(Blog.last)
  end

  test 'should show blog' do
    get _blog_url(@blog)
    assert_response :success
  end

  test 'should get edit' do
    get edit__blog_url(@blog)
    assert_response :success
  end

  test 'should update blog' do
    patch _blog_url(@blog), params: { blog: {} }
    assert_redirected_to _blog_url(@blog)
  end

  test 'should destroy blog' do
    assert_difference('Blog.count', -1) do
      delete _blog_url(@blog)
    end

    assert_redirected_to _blogs_url
  end
end
