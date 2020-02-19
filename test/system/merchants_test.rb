require "application_system_test_case"

class MerchantsTest < ApplicationSystemTestCase
  setup do
    @merchant = merchants(:one)
  end

  test "visiting the index" do
    visit merchants_url
    assert_selector "h1", text: "Merchants"
  end

  test "creating a Merchant" do
    visit merchants_url
    click_on "New Merchant"

    fill_in "Description", with: @merchant.description
    fill_in "Email", with: @merchant.email
    fill_in "Name", with: @merchant.name
    fill_in "Status", with: @merchant.status
    fill_in "Total transaction sum", with: @merchant.total_transaction_sum
    click_on "Create Merchant"

    assert_text "Merchant was successfully created"
    click_on "Back"
  end

  test "updating a Merchant" do
    visit merchants_url
    click_on "Edit", match: :first

    fill_in "Description", with: @merchant.description
    fill_in "Email", with: @merchant.email
    fill_in "Name", with: @merchant.name
    fill_in "Status", with: @merchant.status
    fill_in "Total transaction sum", with: @merchant.total_transaction_sum
    click_on "Update Merchant"

    assert_text "Merchant was successfully updated"
    click_on "Back"
  end

  test "destroying a Merchant" do
    visit merchants_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Merchant was successfully destroyed"
  end
end
