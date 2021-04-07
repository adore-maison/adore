class CreateKeywords < ActiveRecord::Migration[6.1]
  def change
    create_table :keywords do |t|
      t.string :phrase
      t.integer :volume
      t.integer :ciq_score
      t.integer :cpr_eight_day_giveaway
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
