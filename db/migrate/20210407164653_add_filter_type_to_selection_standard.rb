class AddFilterTypeToSelectionStandard < ActiveRecord::Migration[6.1]
  def change
    add_column :selection_standards, :filter_type, :integer
  end
end
