class Episode < ApplicationRecord
  belongs_to :season, inverse_of: :episode

  validates :length, presence: true, numericality: { less_than_or_equal_to: 300, only_integer: true }
  validates :summary, presence: true, length: {maximum: 140}
  validates :number, presence: true, numericality: { greater_than_or_equal_to: 1, only_integer: true }
  validates :name, presence: true, length: {maximum: 50}
end
