class Match < ApplicationRecord
  belongs_to :team_a,  class_name: "Team", foreign_key:"team_id_a"
  belongs_to :team_b,  class_name: "Team", foreign_key:"team_id_b"
  has_many :predictions, dependent: :destroy
  # belongs_to :pool, dependent: :destroy

  def set_default_date
    self.date = DateTime.now
  end

  def predictable?
    if DateTime.now < self.date
      true
    else
      false
    end
  end
  def finished?
    if self.score_a && self.score_b
      true
    else
      false
    end
  end
end
