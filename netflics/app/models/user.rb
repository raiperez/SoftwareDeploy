class User < ApplicationRecord
  has_many :parent_children
  has_many :child, through: :parent_children
  has_one :child_parent, class_name: "ParentChild", foreign_key: "child_id"
  has_one :parent, through: :child_parent, source: :user

	has_one :user_roles, class_name: "UserRole", foreign_key: "user_id"
	has_one :role, through: :user_roles

  validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  before_save :email_downcaser
  has_secure_password on: :create
  validates :password, presence: true, length: { minimum: 6 }, on: :create

  def email_downcaser
    self.email = self.email.downcase
  end

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
