class CreateSelectionStandards < ActiveRecord::Migration[6.1]
  def change
    create_table :selection_standards do |t|
      t.string :name

      t.timestamps
    end
  end
end
