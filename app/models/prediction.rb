class Prediction < ApplicationRecord
  belongs_to :match
  belongs_to :user
  validates :score_a, presence: true
  validates :score_b, presence: true


  def update_points
    if self.match.finished? && score_a.present? && score_b.present?
      update(:points => get_points_for_prediction(self))
      update(:is_good_result => check_if_same_result?(self, self.match))
      update(:is_exact_score => check_if_equal_score?(self, self.match))
    else
      update(:points => 0)
      update(:is_good_result => nil)
      update(:is_exact_score => nil)
    end
  end

  private

  def get_points_for_prediction(prediction)
    if check_if_equal_score?(prediction, prediction.match)
      return 3
    elsif check_if_same_result?(prediction, prediction.match)
      return 1
    else
      return 0
    end
  end


  def check_if_equal_score?(result_1, result_2)
    if result_1.score_a == result_2.score_a && result_1.score_b == result_2.score_b
      return true
    else
      return false
    end
  end

  def check_if_same_result?(result_1, result_2)
    if get_result_for_score(result_1) == get_result_for_score(result_2)
      return true
    else
      false
    end
  end

  def get_result_for_score(result)
    if result.score_a > result.score_b
      return 1
    elsif result.score_a < result.score_b
      return 2
    elsif result.score_a == result.score_b
      return 0
    else
      return nil
    end
  end

end
