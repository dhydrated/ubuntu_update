require 'spec_helper'
require 'ubuntu_update/options_parser'

describe UbuntuUpdate::OptionsParser, "#get_summary" do
	# it "it should print out usage syntax" do
	# 	options_parser = UbuntuUpdate::OptionsParser.new		
	# 	options_parser.parse([])
	# 	expect(options_parser.get_summary).to include("Usage: ubuntu_upgrade.rb [options]")
	# 	expect(options_parser.get_summary).to include("-v, --[no-]verbose")
	# 	expect(options_parser.get_options).not_to include(:verbose)
	# end

	it "it should contains :verbose when passed -v in the argument" do
		options_parser = UbuntuUpdate::OptionsParser.new
		options_parser.parse(["-v"])
		expect(options_parser.get_options).to include({:verbose=>true})
	end

	it "it should contains :update when passed -p in the argument" do
		options_parser = UbuntuUpdate::OptionsParser.new
		options_parser.parse(["-p"])
		expect(options_parser.get_options).to include({:update=>true})
	end

	it "it should contains :upgrade when passed -g in the argument" do
		options_parser = UbuntuUpdate::OptionsParser.new
		options_parser.parse(["-g"])
		expect(options_parser.get_options).to include({:upgrade=>true})
	end
end