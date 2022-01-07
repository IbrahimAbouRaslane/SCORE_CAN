class Pool < ApplicationRecord
  validates :name, presence: true
  has_many :teams
end
