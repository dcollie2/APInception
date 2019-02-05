require "application_system_test_case"

class ProgramsTest < ApplicationSystemTestCase
  setup do
    @program = programs(:one)
  end

  test "visiting the index" do
    visit programs_url
    assert_selector "h1", text: "Programs"
  end

  test "creating a Program" do
    visit programs_url
    click_on "New Program"

    fill_in "Body", with: @program.body
    fill_in "Code", with: @program.code
    fill_in "College", with: @program.college
    fill_in "College Code", with: @program.college_code
    fill_in "Degree Type", with: @program.degree_type
    fill_in "Department", with: @program.department
    fill_in "Department Code", with: @program.department_code
    fill_in "Green Leaf Prog", with: @program.green_leaf_prog
    fill_in "Joint Program", with: @program.joint_program
    fill_in "Program Title", with: @program.program_title
    fill_in "Program Type", with: @program.program_type
    fill_in "Schev Status", with: @program.schev_status
    fill_in "Title", with: @program.title
    click_on "Create Program"

    assert_text "Program was successfully created"
    click_on "Back"
  end

  test "updating a Program" do
    visit programs_url
    click_on "Edit", match: :first

    fill_in "Body", with: @program.body
    fill_in "Code", with: @program.code
    fill_in "College", with: @program.college
    fill_in "College Code", with: @program.college_code
    fill_in "Degree Type", with: @program.degree_type
    fill_in "Department", with: @program.department
    fill_in "Department Code", with: @program.department_code
    fill_in "Green Leaf Prog", with: @program.green_leaf_prog
    fill_in "Joint Program", with: @program.joint_program
    fill_in "Program Title", with: @program.program_title
    fill_in "Program Type", with: @program.program_type
    fill_in "Schev Status", with: @program.schev_status
    fill_in "Title", with: @program.title
    click_on "Update Program"

    assert_text "Program was successfully updated"
    click_on "Back"
  end

  test "destroying a Program" do
    visit programs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Program was successfully destroyed"
  end
end
