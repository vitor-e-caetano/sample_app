require 'spec_helper'

describe "User pages" do

	subject { page }

	describe "signup page" do

		before { visit signup_path }

		it { page.should have_selector('h1', text: 'Sign up') }
		it { page.source.should have_selector('title', text: full_title('Sign up')) }
	end
end

module ::RSpec::Core
  class ExampleGroup
    include Capybara::DSL
    include Capybara::RSpecMatchers
  end
end