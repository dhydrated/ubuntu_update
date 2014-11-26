require "ubuntu_update/version"

module UbuntuUpdate
  class Updater

  	@options_parser
  	@command_list
  	@@apt_get_command = "sudo apt-get %{command}"
  	@resolved_command

  	def initialize (options_parser)
  		@options_parser = options_parser
  		@command_list = []
  	end

  	def get_command

  		if @options_parser.get_options.has_key? (:update) or options_does_not_contains_any_command? 
  			@command_list.push(update)
  		end
  		if @options_parser.get_options.has_key? (:upgrade)
  			@command_list.push(upgrade)
  		end

  		@command_list * " && "
  	end

  	def execute_command
  		exec get_command
  	end

    private

  	def options_does_not_contains_any_command?
  		not [:update, :upgrade].any? {|k| @options_parser.get_options.key?(k)}
  	end

    def update
      resolve_command(:update)
    end

    def upgrade
   	  upgrade_command = "upgrade%{confirm}"

   	  if @options_parser.get_options[:yes]
   	  	confirm = " -y"
   	  else
   	  	confirm = ""
   	  end
   	  upgrade_command = upgrade_command % {:confirm => confirm} 
      resolve_command(upgrade_command)
    end

    def resolve_command(command)
    	@@apt_get_command % {:command => command}
    end
  end
end
