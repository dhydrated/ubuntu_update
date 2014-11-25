require 'spec_helper'
require 'ubuntu_update/command_executor'

describe UbuntuUpdate::CommandExecutor, "#get_summary" do
	it "it should print out usage syntax" do
		executor = UbuntuUpdate::CommandExecutor.new		
		executor.parse([])
		expect(executor.get_summary).to include("Usage: ubuntu_upgrade.rb [options]")
		expect(executor.get_summary).to include("-v, --[no-]verbose")
		expect(executor.get_options).not_to include(:verbose)
	end

	it "it should contains :verbose when passed -v in the argument" do
		executor = UbuntuUpdate::CommandExecutor.new
		executor.parse(["-v"])
		expect(executor.get_options).to include(:verbose)
	end
end