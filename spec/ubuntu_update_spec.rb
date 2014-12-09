require 'spec_helper'
require 'ubuntu_update'
require 'ubuntu_update/options_parser'
require 'ubuntu_update/command_executor'


describe UbuntuUpdate::Updater, "#execute_command" do

	subject(:updater) do 
		updater = UbuntuUpdate::Updater.new options_parser, command_executor
	end

	let(:command_executor) do
		command_executor = UbuntuUpdate::CommandExecutor.new		
	end

	let(:options_parser) do
		options_parser = UbuntuUpdate::OptionsParser.new		
	end

	it "it should show summary when --help is passed in" do
		command_executor.expects(:execute).with(includes("My script summary"))

		options_parser.expects(:get_options).at_least(1).returns({:help => true})
		options_parser.expects(:get_summary).at_least(1).returns("My script summary")
		
		updater.execute_command
	end

	it "it should run apt-get update when no argument passed in" do
		options_parser.expects(:get_options).at_least(1).returns({})

		command_executor.expects(:execute).with("sudo apt-get update")

		updater.execute_command
	end

	it "it should run apt-get update when passed in {:update=>true}" do
		options_parser.expects(:get_options).at_least(1).returns({:update=>true})

		command_executor.expects(:execute).with("sudo apt-get update")

		updater.execute_command
	end

	it "it should run apt-get update when passed in {:upgrade=>true}" do
		options_parser.expects(:get_options).at_least(1).returns({:upgrade=>true})

		command_executor.expects(:execute).with("sudo apt-get upgrade")

		updater.execute_command
	end

	it "it should run apt-get upgrade with -y when passed in {:yes=>true}" do
		options_parser.expects(:get_options).at_least(1).returns({:yes=>true, :upgrade=>true})

		command_executor.expects(:execute).with("sudo apt-get upgrade -y")

		updater.execute_command
	end

	it "it should run apt-get upgrade and upgrade when passed in {:update=>true, :upgrade=>true}" do
		options_parser.expects(:get_options).at_least(1).returns({:update=>true, :upgrade=>true})

		command_executor.expects(:execute).with("sudo apt-get update && sudo apt-get upgrade")

		updater.execute_command
	end
end
