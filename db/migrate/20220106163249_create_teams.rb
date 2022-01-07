class CreateTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :teams, id: :uuid do |t|
      t.string :name
      t.string :flag_url
      t.references :pool, null: false, foreign_key: true, type: :uuid
      t.timestamps
    end
  end
end