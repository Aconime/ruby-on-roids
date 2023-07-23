require "test_helper"

class Api::BlogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @blog = blogs(:one)
  end

  test "should get index" do
    get api_blogs_url
    assert_response :success
  end

  test "should get new" do
    get new_api_blog_url
    assert_response :success
  end

  test "should create blog" do
    assert_difference("Blog.count") do
      post api_blogs_url, params: { blog: {  } }
    end

    assert_redirected_to api_blog_url(Blog.last)
  end

  test "should show blog" do
    get api_blog_url(@blog)
    assert_response :success
  end

  test "should get edit" do
    get edit_api_blog_url(@blog)
    assert_response :success
  end

  test "should update blog" do
    patch api_blog_url(@blog), params: { blog: {  } }
    assert_redirected_to api_blog_url(@blog)
  end

  test "should destroy blog" do
    assert_difference("Blog.count", -1) do
      delete api_blog_url(@blog)
    end

    assert_redirected_to api_blogs_url
  end
end
