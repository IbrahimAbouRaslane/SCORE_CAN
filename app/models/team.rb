class Team < ApplicationRecord
  validates :name, :flag_url, presence: true
  belongs_to :pool
end
