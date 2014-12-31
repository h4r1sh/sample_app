# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ActiveRecord::Base
  attr_accessible :email, :name, :password, :password_confirmation
  has_secure_password

  before_save do |user|
    user.email = email.downcase
  end
  before_save :create_remember_token
  
  VALID_EMAIL_REGEX = /\A[a-z][\w-]*@[\w]+(\.[\w-]+)*\.[\w-]+\z/i
  
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }

   private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end
