class CreatePredictions < ActiveRecord::Migration[6.1]
  def change
    create_table :predictions, id: :uuid do |t|
      t.integer :score_a
      t.integer :score_b
      t.integer :points, :default => 0
      t.integer :predicted_result
      t.boolean :is_good_result
      t.boolean :is_exact_score
      t.references :match, null: false, foreign_key: true, type: :uuid
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
