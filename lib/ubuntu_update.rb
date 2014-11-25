require "ubuntu_update/version"

module UbuntuUpdate
  class Updater

  	command = ""
  	@@apt_get_command = "sudo apt-get %{command}"

    def update
      resolve_command(:update)
    end

    def upgrade
      resolve_command(:upgrade)
    end

    private

    def resolve_command(command)
    	@@apt_get_command % {:command => command}
    end
  end
end
