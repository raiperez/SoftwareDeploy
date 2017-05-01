class Director < ApplicationRecord
	has_many :series_director, inverse_of: :director
  has_many :series, through: :series_director

  validates :first_name, presence: true, length: {maximum: 50}
  validates :last_name, presence: true, length: {maximum: 50}
end
