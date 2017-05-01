class ParentChild < ApplicationRecord
	  belongs_to :user
  	belongs_to :child, :class_name => 'User'

		validates :user_id, presence: true, numericality: { greater_than_or_equal_to: 0, only_integer: true }
		validates :child_id, presence: true, numericality: { greater_than_or_equal_to: 0, only_integer: true }
end
