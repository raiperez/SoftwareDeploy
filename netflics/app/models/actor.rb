class Actor < ApplicationRecord
  has_many :series_actor, inverse_of: :actor
  has_many :series, through: :series_actor

  validates :first_name, presence: true, length: {maximum: 50}
  validates :last_name, presence: true, length: {maximum: 50}
end
