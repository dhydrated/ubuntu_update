require "ubuntu_update/version"

module UbuntuUpdate
  class Updater

  	@options_parser
  	@command_list
  	@@apt_get_command = "sudo apt-get %{command}"
  	@resolved_command

  	def initialize (options_parser, command_executor)
  		@command_executor = command_executor
  		@options_parser = options_parser
  		@command_list = []
  	end

  	def execute_command
  		@command_executor.execute get_command
  	end

    private

    def get_command

  		build_commands

  		join_commands
  	end

  	def join_commands
  		@command_list * " && "
  	end

    def build_commands
    	if @options_parser.get_options.has_key? (:help)
  			@command_list.push(get_print_summary)
  		else
	  		if @options_parser.get_options.has_key? (:update) or 
	  		options_does_not_contains_any_command? 
	  			@command_list.push(get_update)
	  		end
	  		if @options_parser.get_options.has_key? (:upgrade)
	  			@command_list.push(get_upgrade)
	  		end
  		end
  	end

  	def options_does_not_contains_any_command?
  		not [:update, :upgrade].any? {|k| @options_parser.get_options.key?(k)}
  	end

  	def get_print_summary
  		"echo '#{@options_parser.get_summary}'"
  	end

    def get_update
      resolve_command(:update)
    end

    def get_upgrade
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
