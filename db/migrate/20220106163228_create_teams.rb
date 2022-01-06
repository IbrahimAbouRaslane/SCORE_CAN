class CreateTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :teams, id: :uuid do |t|
      t.string :name
      t.string :flag_url

      t.timestamps
    end
  end
end
