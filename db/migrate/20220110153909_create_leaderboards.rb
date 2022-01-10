class CreateLeaderboards < ActiveRecord::Migration[6.1]
  def change
    create_table :leaderboards, id: :uuid do |t|

      t.timestamps
    end
  end
end
