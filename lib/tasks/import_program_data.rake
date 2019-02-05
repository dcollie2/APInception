namespace :import_program_data do
  include Rake::DSL

  task :all => :environment do
    url = 'https://catalog.gmu.edu/ribbit/?page=getprogram.rjs&code=*'
    response = Nokogiri::XML(open(url))
    codes = []
    bad_codes = []
    response.xpath('programinfo/program').each do |program|
      code = program.attribute('code').value
      if code.present? && !codes.include?(code) and code.include?('-')
        codes << code
        program_url = "https://catalog.gmu.edu/ribbit/?page=getprogram.rjs&code=#{code}"
        puts "Getting #{program_url}"
        program_xml = Nokogiri::XML(open(program_url))
        title = program_xml.xpath('programinfo/program/title').first.content
        college = program_xml.xpath('programinfo/program/college').first.content
        college_code = program_xml.xpath('programinfo/program/customfields/college').first.content
        department = program_xml.xpath('programinfo/program/department').first.content
        department_code = program_xml.xpath('programinfo/program/customfields/department').first.content
        body = program_xml.xpath('programinfo/program/body').first.content
        program_type = program_xml.xpath('programinfo/program/customfields/prog_type').first.content
        degree_type = program_xml.xpath('programinfo/program/customfields/degree_type').first.content
        program_title = program_xml.xpath('programinfo/program/customfields/programtitle').first.content
        schev_status = program_xml.xpath('programinfo/program/customfields/schev_status').first.content
        joint_program = program_xml.xpath('programinfo/program/customfields/joint_program').first.content
        code = program_xml.xpath('programinfo/program/customfields/code').first.content
        green_leaf_prog = program_xml.xpath('programinfo/program/customfields/green_leaf_prog').first.content

        puts title
        puts college
        puts college_code
        puts department
        puts department_code
        puts body
        puts program_type
        puts degree_type
        puts program_title
        puts schev_status
        puts joint_program
        puts code
        puts green_leaf_prog

        program = Program.find_or_create_by(code: code)
        program.update(title: title, college: college, college_code: college_code, department: department, department_code: department_code, body: body, program_type: program_type, degree_type: degree_type, program_title: program_title, schev_status: schev_status, joint_program: joint_program, code: code, green_leaf_prog: green_leaf_prog)
      else
        bad_codes << code
      end
    end
    puts "CODES: #{codes}"
    puts "BAD_CODES: #{bad_codes}"
  end
end
