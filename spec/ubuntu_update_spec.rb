require 'spec_helper'
require 'ubuntu_update'


describe UbuntuUpdate::Updater, "#execute" do

	it "it should run apt-get update when no argument passed in" do
		options_parser = UbuntuUpdate::OptionsParser.new
		options_parser.expects(:get_options).at_least(1).returns({})

		updater = UbuntuUpdate::Updater.new (options_parser)
		expect(updater.get_command).to eq("sudo apt-get update")
	end

	it "it should run apt-get update when passed in {:update=>true}" do
		options_parser = UbuntuUpdate::OptionsParser.new
		options_parser.expects(:get_options).at_least(1).returns({:update=>true})

		updater = UbuntuUpdate::Updater.new (options_parser)
		expect(updater.get_command).to eq("sudo apt-get update")
	end

	it "it should run apt-get update when passed in {:upgrade=>true}" do
		options_parser = UbuntuUpdate::OptionsParser.new
		options_parser.expects(:get_options).at_least(1).returns({:upgrade=>true})

		updater = UbuntuUpdate::Updater.new (options_parser)
		expect(updater.get_command).to eq("sudo apt-get upgrade")
	end

	it "it should run apt-get upgrade with -y when passed in {:yes=>true}" do
		options_parser = UbuntuUpdate::OptionsParser.new
		options_parser.expects(:get_options).at_least(1).returns({:yes=>true, :upgrade=>true})

		updater = UbuntuUpdate::Updater.new (options_parser)
		expect(updater.get_command).to eq("sudo apt-get upgrade -y")
	end

	it "it should run apt-get upgrade and upgrade when passed in {:update=>true, :upgrade=>true}" do
		options_parser = UbuntuUpdate::OptionsParser.new
		options_parser.expects(:get_options).at_least(1).returns({:update=>true, :upgrade=>true})

		updater = UbuntuUpdate::Updater.new (options_parser)
		expect(updater.get_command).to eq("sudo apt-get update && sudo apt-get upgrade")
	end
end
