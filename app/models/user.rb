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
  attr_accessible :email, :name

  before_save do |user|
    user.email.downcase!
  end
  
  VALID_EMAIL_REGEX = /\A[a-z][\w-]*@[\w]+(\.[\w-]+)*\.[\w-]+\z/i
  
  validates :name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
end