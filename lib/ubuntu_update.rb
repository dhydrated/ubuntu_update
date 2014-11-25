require "ubuntu_update/version"

module UbuntuUpdate
  class Updater

  	command = ""
  	@@apt_get_command = "sudo apt-get %{command}"

  	def initialize (options={})
  		@options = options
  	end

  	def get_command

  		if @options[:update]
  			output = update
  		elsif @options[:upgrade]
  			output = upgrade
  		end

  		output
  	end

  	def execute_command
  		exec get_command
  	end

    def update
      resolve_command(:update)
    end

    def upgrade
   	  upgrade_command = "upgrade%{confirm}"

   	  if @options[:yes]
   	  	confirm = " -y"
   	  else
   	  	confirm = ""
   	  end
   	  upgrade_command = upgrade_command % {:confirm => confirm} 
      resolve_command(upgrade_command)
    end

    private

    def resolve_command(command)
    	@@apt_get_command % {:command => command}
    end
  end
end
