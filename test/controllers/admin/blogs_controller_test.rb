require "test_helper"

class Admin::BlogsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @blog = blogs(:one)
  end

  test "should get index" do
    get admin_blogs_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_blog_url
    assert_response :success
  end

  test "should create blog" do
    assert_difference("Blog.count") do
      post admin_blogs_url, params: { blog: {  } }
    end

    assert_redirected_to admin_blog_url(Blog.last)
  end

  test "should show blog" do
    get admin_blog_url(@blog)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_blog_url(@blog)
    assert_response :success
  end

  test "should update blog" do
    patch admin_blog_url(@blog), params: { blog: {  } }
    assert_redirected_to admin_blog_url(@blog)
  end

  test "should destroy blog" do
    assert_difference("Blog.count", -1) do
      delete admin_blog_url(@blog)
    end

    assert_redirected_to admin_blogs_url
  end
end
