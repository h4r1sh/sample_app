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

require 'rails_helper'

describe User do
  before { @user = User.new(name: "H", email: "h@example.com", password: "helper", password_confirmation: "helper")  }
  subject { @user }

  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:password_digest)}
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:authenticate) }

  it { should be_valid }

  describe "when name is not present" do
    before { @user.name = ' ' }
    it { should_not be_valid }
  end

  describe "when name is too long" do
    before { @user.name = 'a' * 51 }
    it { should_not be_valid }
  end

  describe "when email is not present" do
    before { @user.email = '' }
    it { should_not be_valid }
  end

  describe "when email format is not valid" do
    it "should be invalid" do
      addrs = %w[user@foo,com wqfwefew @a.com @ foo.example.com google.com h@h@]
      addrs.each do |addr|
        @user.email = addr
        @user.should_not be_valid
      end
    end
  end

  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[user@example.com mail@freshdesk.com m@a.c]
      addresses.each do |addr|
        @user.email = addr
        @user.should be_valid
      end
    end
  end

  describe "when email address is already in use" do
    before do
      user = @user.dup
      user.email = @user.email.upcase
      user.save
    end
    it {should_not be_valid}
  end

  describe "when password is blank" do
    before { @user.password = @user.password_confirmation = ' '}
    it { should_not be_valid }
  end

  describe "when password is not same as it's confirmation" do
    before { @user.password_confirmation = 'nothing' }
    it { should_not be_valid }
  end

  describe "password authentication" do
    before { @user.save }
    let(:found_user) { User.find_by_email(@user.email) }

    describe "valid pass" do
      it { should == found_user.authenticate(@user.password) }
    end

  end

   describe "with a password that's too short" do
    before { @user.password = @user.password_confirmation = "a" * 5 }
    it { should be_invalid }
  end

  
end
