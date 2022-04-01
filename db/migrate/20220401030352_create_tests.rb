class CreateTests < ActiveRecord::Migration[7.0]
  def change
    create_table :tests do |t|
      t.string :patient_name
      t.string :patient_sex
      t.integer :patient_age
      t.integer :questions, array: true, default: []
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
