require 'spec_helper'
require 'ubuntu_update'

describe UbuntuUpdate::Updater, "#update" do
	it "it should run apt-get update" do
		updater = UbuntuUpdate::Updater.new
		expect(updater.update).to eq("sudo apt-get update")
	end
end

describe UbuntuUpdate::Updater, "#upgrade" do
	it "it should run apt-get upgrade" do
		updater = UbuntuUpdate::Updater.new
		expect(updater.upgrade).to eq("sudo apt-get upgrade")
	end
end

describe UbuntuUpdate::Updater, "#execute" do
	it "it should run apt-get update when passed in {:update=>true}" do
		updater = UbuntuUpdate::Updater.new ({:update=>true})
		expect(updater.get_command).to eq("sudo apt-get update")
	end

	it "it should run apt-get update when passed in {:upgrade=>true}" do
		updater = UbuntuUpdate::Updater.new ({:upgrade=>true})
		expect(updater.get_command).to eq("sudo apt-get upgrade")
	end

	it "it should run apt-get upgrade with -y when passed in {:yes=>true}" do
		updater = UbuntuUpdate::Updater.new ({:yes=>true, :upgrade=>true})
		expect(updater.get_command).to eq("sudo apt-get upgrade -y")
	end
end
