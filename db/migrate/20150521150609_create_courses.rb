class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name, limit: 45
      t.string :description, limit: 45
      t.integer :status, default: 0

      t.timestamps
    end
    add_index :courses, :name, unique: true
  end
end
