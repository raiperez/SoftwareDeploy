class Season < ApplicationRecord
  belongs_to :series, inverse_of: :season
  has_many :episode, inverse_of: :season

  validates :number, presence: true, numericality: { less_than_or_equal_to: 20000, only_integer: true }
  validates :year, presence: true, numericality: { greater_than_or_equal_to: 1900, only_integer: true }
  validates :summary, presence: true, length: {maximum: 140}
end
