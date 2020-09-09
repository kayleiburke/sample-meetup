require 'test_helper'

class GroupsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @group = groups(:one)
  end

  test "should get index" do
    get groups_url
    assert_response :success
  end

  test "should get new" do
    get new_group_url
    assert_response :success
  end

  test "should create group" do
    assert_difference('Group.count') do
      post groups_url, params: { group: { name: "Test Group" } }
    end

    assert_redirected_to group_url(Group.last)
  end

  test "should show group" do
    get group_url(@group)
    assert_response :success
  end

  test "should get edit" do
    get edit_group_url(@group)
    assert_response :success
  end

  test "should update group" do
    patch group_url(@group), params: { group: { name: "My updated name" } }
    assert_redirected_to group_url(@group)
  end

  test "should destroy group" do
    assert_difference('Group.count', -1) do
      delete group_url(@group)
    end

    assert_redirected_to groups_url
  end

  test "should create user when importing csv" do
    # there are 3 valid rows with 3 distinct users in the test import file
    assert_difference('User.count', 3) do
      open_csv
    end
  end

  test "should create group when importing csv" do
    # there are 3 valid rows with 2 distince groups in the test import file
    assert_difference('Group.count', 2) do
      open_csv
    end
  end

  test "should create engagement when importing csv" do
    # there are 3 valid rows in the test import file
    assert_difference('Engagement.count', 3) do
      open_csv
    end
  end

  def open_csv
    post import_groups_path, params: { file: fixture_file_upload('files/test.csv','csv') }
  end

end
