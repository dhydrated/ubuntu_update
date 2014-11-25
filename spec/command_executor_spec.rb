require 'spec_helper'
require 'ubuntu_update/options_parser'

describe UbuntuUpdate::OptionsParser, "#get_summary" do
	it "it should print out usage syntax" do
		executor = UbuntuUpdate::OptionsParser.new		
		executor.parse([])
		expect(executor.get_summary).to include("Usage: ubuntu_upgrade.rb [options]")
		expect(executor.get_summary).to include("-v, --[no-]verbose")
		expect(executor.get_options).not_to include(:verbose)
	end

	it "it should contains :verbose when passed -v in the argument" do
		executor = UbuntuUpdate::OptionsParser.new
		executor.parse(["-v"])
		expect(executor.get_options).to include({:verbose=>true})
	end

	it "it should contains :update when passed -p in the argument" do
		executor = UbuntuUpdate::OptionsParser.new
		executor.parse(["-p"])
		expect(executor.get_options).to include({:update=>true})
	end

	it "it should contains :upgrade when passed -g in the argument" do
		executor = UbuntuUpdate::OptionsParser.new
		executor.parse(["-g"])
		expect(executor.get_options).to include({:upgrade=>true})
	end
end