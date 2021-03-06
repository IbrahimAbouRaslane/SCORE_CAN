class CreatePools < ActiveRecord::Migration[6.1]
  def change
    create_table :pools, id: :uuid do |t|
      t.string :name
      t.references :team, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
