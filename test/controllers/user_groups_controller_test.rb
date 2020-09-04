require 'test_helper'

class UserGroupRolesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @user_group_role = user_group_roles(:one)
  end

  test "should get index" do
    get user_group_roles_url
    assert_response :success
  end

  test "should get new" do
    get new_user_group_role_url
    assert_response :success
  end

  test "should create user_group_role" do
    assert_difference('UserGroupRole.count') do
      post user_group_roles_url, params: { user_group_role: {  } }
    end

    assert_redirected_to user_group_role_url(UserGroupRole.last)
  end

  test "should show user_group_role" do
    get user_group_role_url(@user_group_role)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_group_role_url(@user_group_role)
    assert_response :success
  end

  test "should update user_group_role" do
    patch user_group_role_url(@user_group_role), params: { user_group_role: {  } }
    assert_redirected_to user_group_role_url(@user_group_role)
  end

  test "should destroy user_group_role" do
    assert_difference('UserGroupRole.count', -1) do
      delete user_group_role_url(@user_group_role)
    end

    assert_redirected_to user_group_roles_url
  end
end
