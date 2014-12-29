require 'spec_helper'
require 'rails_helper'


describe "Static Pages" do

  describe "Home Page" do
    it "should have the content 'Sample App'" do
      visit '/static_pages/home'
      page.should have_content('Sample')
    end
    
    it "should have the right title" do
      visit '/static_pages/home'
      page.should have_title("Ruby on Rails Sample App | Home")
    end
  end
  
  describe "Help Page" do
    it "should have the content 'Help'" do
      visit '/static_pages/help'
      page.should have_content('Help')
    end
    
    it "should have the right title" do
      visit '/static_pages/help'
      page.should have_title("Ruby on Rails Sample App | Help")
    end
  end
  
  describe "About Page" do
    it "should have the content 'About'" do
      visit '/static_pages/about'
      page.should have_content('About')
    end
    
    it "should have the right title" do
      visit '/static_pages/about'
      page.should have_title("Ruby on Rails Sample App | About")
    end
  end
  
  describe "Contact Page" do
    it "should have content 'Contact'" do
      visit '/static_pages/contact'
      page.should have_content('Contact')
    end
    
    it "should have the right title" do
      visit '/static_pages/contact'
      page.should have_title("Ruby on Rails Sample App | Contact")
    end
  end
  
  
end

