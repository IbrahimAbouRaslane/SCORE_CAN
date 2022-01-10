class CreateLeaderbords < ActiveRecord::Migration[6.1]
  def change
    create_table :leaderbords, id: :uuid do |t|

      t.timestamps
    end
  end
end
