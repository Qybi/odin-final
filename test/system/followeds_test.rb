require "application_system_test_case"

class FollowedsTest < ApplicationSystemTestCase
  setup do
    @followed = followeds(:one)
  end

  test "visiting the index" do
    visit followeds_url
    assert_selector "h1", text: "Followeds"
  end

  test "should create followed" do
    visit followeds_url
    click_on "New followed"

    fill_in "Followed user", with: @followed.followed_user_id
    fill_in "User", with: @followed.user_id
    click_on "Create Followed"

    assert_text "Followed was successfully created"
    click_on "Back"
  end

  test "should update Followed" do
    visit followed_url(@followed)
    click_on "Edit this followed", match: :first

    fill_in "Followed user", with: @followed.followed_user_id
    fill_in "User", with: @followed.user_id
    click_on "Update Followed"

    assert_text "Followed was successfully updated"
    click_on "Back"
  end

  test "should destroy Followed" do
    visit followed_url(@followed)
    click_on "Destroy this followed", match: :first

    assert_text "Followed was successfully destroyed"
  end
end
