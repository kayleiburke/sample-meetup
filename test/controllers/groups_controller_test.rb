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
    # assert_difference('User.count') do
      open_csv
    # end

    debugger
    assert_redirected_to group_url(User.find_by(first_name: "Bob", last_name: "Billy"))
  end

  test "should create group when importing csv" do
    open_csv
    assert_not_nil Group.find_by(name: "Sit 'n Stitch")
  end

  test "should create engagement when importing csv" do
    open_csv
    debugger
    assert_not_nil Engagement.find_by(user: users(:three), group: groups(:two), role: :presenter )
  end

  def open_csv
    post import_groups_path, params: { file: fixture_file_upload('files/test.csv','csv') }
  end

end
