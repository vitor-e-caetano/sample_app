require 'spec_helper'

describe "Static pages" do

	subject { page }

	shared_examples_for "all static pages" do
		it { page.should have_selector('h1', text: heading) }
		it { page.source.should have_selector('title', text: full_title(page_title)) }
	end

	describe "Home page" do
		before { visit root_path }

		let(:heading) { 'Sample App' }
		let(:page_title) { '' }

		it_should_behave_like "all static pages"

		it { page.should_not have_selector('title', text: '| Home') }

	end

	describe "Contact page" do
		before { visit contact_path }

		let(:heading) { 'Contact' }
		let(:page_title) { 'Contact' }

		it_should_behave_like "all static pages"

		it { page.should_not have_selector('title', text: '| Contact') }

	end
	describe "Help page" do
		before { visit help_path }

		let(:heading) { 'Help' }
		let(:page_title) { 'Help' }

		it_should_behave_like "all static pages"

		it { page.should_not have_selector('title', text: '| Help') }

	end

	describe "About page" do

		before { visit about_path }

		let(:heading) { 'About' }
		let(:page_title) { 'About' }

		it_should_behave_like "all static pages"

		it { page.should_not have_selector('title', text: '| About') }

	end

	it "should have the right links on the layout" do
		visit root_path
		click_link "About"
		page.source.should have_selector 'title', text: full_title( 'About Us' )
		click_link "Help"
		page.source.should have_selector 'title', text: full_title( 'Help' )
		click_link "Contact"
		page.source.should have_selector 'title', text: full_title( 'Contact' )
		click_link "Home"
		page.source.should have_selector 'title', text: full_title( '' )
		click_link "Sign up now!"
		page.source.should have_selector 'title', text: full_title( 'Sign up' )
#		click_link "sample app"
#		page.source.should have_selector 'title', text: "Learn Web Development with The Ruby on Rails Tutorial"
	end

end

module ::RSpec::Core
	class ExampleGroup
		include Capybara::DSL
		include Capybara::RSpecMatchers
	end
end