class CreateSelectionRules < ActiveRecord::Migration[6.1]
  def change
    create_table :selection_rules do |t|
      t.belongs_to :product
      t.belongs_to :selection_standard

      t.timestamps
    end
  end
end
