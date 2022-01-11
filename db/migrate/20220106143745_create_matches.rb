class CreateMatches < ActiveRecord::Migration[6.1]
  def change
    create_table :matches, id: :uuid do |t|
      t.datetime :date
      t.time :start_at
      t.references :team_a, index: true, class:'Team', type: :uuid
      t.references :team_b, index: true, class:'Team', type: :uuid
      t.integer :score_a, :default => 0
      t.integer :score_b, :default => 0
      t.references :pool, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
