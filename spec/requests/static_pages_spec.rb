require 'spec_helper'

describe "Static pages" do

	subject { page }

	describe "Home page" do

		before { visit root_path }

		it { page.should have_selector('h1', text: 'Sample App') }
			
		it { page.source.should have_selector('title', text: full_title('')) }

		it { page.should_not have_selector('title', text: '| Home') }

	end

#	describe "Contact page" do
#		it "should have the h1 'Contact'" do
#			visit contact_path
#			page.should have_selector('h1', text: 'Contact')
#		end
#		it "should have the title 'Contact'" do
#			visit '/static_pages/contact'
#			page.should have_selector('title',
#				text: "Ruby on Rails Tutorial Sample App | Contact" )
#		end
#	end
#		describe "Help page" do
#
#			it "should have the h1 'Help'" do
#				visit '/static_pages/help '
#				page.should have_selector('h1', :text => 'Help')
#			end
#
#			it "should have the title 'Help'" do
#				visit '/static_pages/help '
#				page.should have_selector('title',
#				:text => "Ruby on Rails Tutorial Sample App | Help")
#			end
#		end
#
#		describe "About page" do
#
#			it "should have the h1 'About Us'" do
#				visit '/static_pages/about'
#				page.should have_selector('h1', :text => 'About Us')
#			end
#
#			it "should have the title 'About Us'" do
#				visit '/static_pages/about'
#				page.should have_selector('title',
#				:text => "Ruby on Rails Tutorial Sample App | About Us")
#			end
#		end
end

module ::RSpec::Core
  class ExampleGroup
    include Capybara::DSL
    include Capybara::RSpecMatchers
  end
end