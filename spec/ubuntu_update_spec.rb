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