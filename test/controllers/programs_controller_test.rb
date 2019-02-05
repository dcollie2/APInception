require 'test_helper'

class ProgramsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @program = programs(:one)
  end

  test "should get index" do
    get programs_url
    assert_response :success
  end

  test "should get new" do
    get new_program_url
    assert_response :success
  end

  test "should create program" do
    assert_difference('Program.count') do
      post programs_url, params: { program: { body: @program.body, code: @program.code, college: @program.college, college_code: @program.college_code, degree_type: @program.degree_type, department: @program.department, department_code: @program.department_code, green_leaf_prog: @program.green_leaf_prog, joint_program: @program.joint_program, program_title: @program.program_title, program_type: @program.program_type, schev_status: @program.schev_status, title: @program.title } }
    end

    assert_redirected_to program_url(Program.last)
  end

  test "should show program" do
    get program_url(@program)
    assert_response :success
  end

  test "should get edit" do
    get edit_program_url(@program)
    assert_response :success
  end

  test "should update program" do
    patch program_url(@program), params: { program: { body: @program.body, code: @program.code, college: @program.college, college_code: @program.college_code, degree_type: @program.degree_type, department: @program.department, department_code: @program.department_code, green_leaf_prog: @program.green_leaf_prog, joint_program: @program.joint_program, program_title: @program.program_title, program_type: @program.program_type, schev_status: @program.schev_status, title: @program.title } }
    assert_redirected_to program_url(@program)
  end

  test "should destroy program" do
    assert_difference('Program.count', -1) do
      delete program_url(@program)
    end

    assert_redirected_to programs_url
  end
end
