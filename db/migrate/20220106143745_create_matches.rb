class CreateMatches < ActiveRecord::Migration[6.1]
  def change
    create_table :matches, id: :uuid do |t|
      t.datetime :date
      t.integer :team_a_id
      t.integer :team_b_id
      t.integer :score_a
      t.integer :score_b

      t.timestamps
    end
  end
end
