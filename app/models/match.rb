class Match < ApplicationRecord
  belongs_to :team_a,  class_name: "Team", foreign_key:"team_a_id"
  belongs_to :team_b,  class_name: "Team", foreign_key:"team_b_id"
  has_many :predictions, dependent: :destroy
  belongs_to :pool

  def set_default_date
    self.date = DateTime.now
  end


  def predictable?
    if DateTime.now <= self.date 
      true
    else
      false
    end
  end
  def finished?
  #  raise self.inspect
    if Time.now >= self.start_at + 6300 && DateTime.now == self.date #self.score_a && self.score_b && 
      true
    else
      false
    end
  end
end
