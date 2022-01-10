class Pool < ApplicationRecord
  validates :name, presence: true
  has_many :teams
  has_many :matches

end
