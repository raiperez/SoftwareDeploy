class Role < ApplicationRecord
	has_many :user_roles
	has_many :user, through: :user_roles

	validates :user_id, presence: true, numericality: { greater_than_or_equal_to: 1, only_integer: true }
	validates :role_id, presence: true, numericality: { greater_than_or_equal_to: 1, only_integer: true }
end
