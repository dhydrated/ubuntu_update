require "ubuntu_update/version"

module UbuntuUpdate
  class Updater

  	@command_list
  	@@apt_get_command = "sudo apt-get %{command}"
  	@resolved_command

  	def initialize (options={})
  		@options = options
  		@command_list = []
  	end

  	def get_command

  		if @options[:update]
  			@command_list.push(update)
  		end
  		if @options[:upgrade]
  			@command_list.push(upgrade)
  		end

  		@command_list * " && "
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
