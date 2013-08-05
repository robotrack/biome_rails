require 'spec_helper'

describe "Static pages" do 

  let(:page_title) { "Biome Profiles | "}
  
  describe "Home page" do

    it "should have the content 'Biome Profiles'" do
      visit '/static_pages/home'
      expect(page).to have_content('Biome Profiles')
    end

    it "should have the title 'Home'" do
      visit '/static_pages/home'
      expect(page).to have_title(page_title + "Home")
    end
  end 

  describe "Help page" do

    it "should have the content 'Help'" do
      visit '/static_pages/help'
      expect(page).to have_content('Help')
    end

    it "should have the title 'Help'" do
      visit '/static_pages/help'
      expect(page).to have_title(page_title + "Help")
    end
  end 

  describe "About page" do

    it "should have the content 'About Us'" do
      visit '/static_pages/about'
      expect(page).to have_content('About Us')
    end

    it "should have the title 'About'" do
      visit '/static_pages/about'
      expect(page).to have_title(page_title + "About")
    end
  end


  describe "Contact page" do

    it "should have the content 'Contact'" do
      visit '/static_pages/contact'
      expect(page).to have_content('Contact')
    end

    it "should have the title 'Contact'" do
      visit '/static_pages/contact'
      expect(page).to have_title(page_title + "Contact")
    end
  end
end