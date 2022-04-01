require "application_system_test_case"

class TestsTest < ApplicationSystemTestCase
  setup do
    @test = tests(:one)
  end

  test "visiting the index" do
    visit tests_url
    assert_selector "h1", text: "Tests"
  end

  test "should create test" do
    visit tests_url
    click_on "New test"

    fill_in "Patient age", with: @test.patient_age
    fill_in "Patient name", with: @test.patient_name
    fill_in "Patient sex", with: @test.patient_sex
    fill_in "Questions", with: @test.questions
    fill_in "User", with: @test.user_id
    click_on "Create Test"

    assert_text "Test was successfully created"
    click_on "Back"
  end

  test "should update Test" do
    visit test_url(@test)
    click_on "Edit this test", match: :first

    fill_in "Patient age", with: @test.patient_age
    fill_in "Patient name", with: @test.patient_name
    fill_in "Patient sex", with: @test.patient_sex
    fill_in "Questions", with: @test.questions
    fill_in "User", with: @test.user_id
    click_on "Update Test"

    assert_text "Test was successfully updated"
    click_on "Back"
  end

  test "should destroy Test" do
    visit test_url(@test)
    click_on "Destroy this test", match: :first

    assert_text "Test was successfully destroyed"
  end
end
