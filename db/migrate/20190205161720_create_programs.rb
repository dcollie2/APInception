class CreatePrograms < ActiveRecord::Migration[5.2]
  def change
    create_table :programs do |t|
      t.string :title
      t.string :college_code
      t.string :department_code
      t.text :body
      t.string :program_type
      t.string :degree_type
      t.string :program_title
      t.string :schev_status
      t.string :college
      t.string :department
      t.string :joint_program
      t.string :code
      t.string :green_leaf_prog

      t.timestamps
    end
  end
end
