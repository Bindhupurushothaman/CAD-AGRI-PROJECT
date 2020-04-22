require "application_system_test_case"

class FarmersTest < ApplicationSystemTestCase
  setup do
    @farmer = farmers(:one)
  end

  test "visiting the index" do
    visit farmers_url
    assert_selector "h1", text: "Farmers"
  end

  test "creating a Farmer" do
    visit farmers_url
    click_on "New Farmer"

    fill_in "End", with: @farmer.end
    fill_in "Serial", with: @farmer.serial
    fill_in "State", with: @farmer.state
    fill_in "Working", with: @farmer.working
    fill_in "Year2011", with: @farmer.year2011
    fill_in "Year2012", with: @farmer.year2012
    fill_in "Year2013", with: @farmer.year2013
    fill_in "Year2014", with: @farmer.year2014
    click_on "Create Farmer"

    assert_text "Farmer was successfully created"
    click_on "Back"
  end

  test "updating a Farmer" do
    visit farmers_url
    click_on "Edit", match: :first

    fill_in "End", with: @farmer.end
    fill_in "Serial", with: @farmer.serial
    fill_in "State", with: @farmer.state
    fill_in "Working", with: @farmer.working
    fill_in "Year2011", with: @farmer.year2011
    fill_in "Year2012", with: @farmer.year2012
    fill_in "Year2013", with: @farmer.year2013
    fill_in "Year2014", with: @farmer.year2014
    click_on "Update Farmer"

    assert_text "Farmer was successfully updated"
    click_on "Back"
  end

  test "destroying a Farmer" do
    visit farmers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Farmer was successfully destroyed"
  end
end
