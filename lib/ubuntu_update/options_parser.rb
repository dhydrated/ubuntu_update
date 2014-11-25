require 'optparse'

module UbuntuUpdate
  class OptionsParser


  	def parse arguments
  		@options = {}

		@option_parser = OptionParser.new do |opts|

		  opts.banner = "Usage: ubuntu_upgrade.rb [options]"

		  opts.on("-v", "--[no-]verbose", "Run verbosely") do |v|
		    @options[:verbose] = v
		  end

		  opts.on("-p", "--update", "Run apt-get update") do |p|
		    @options[:update] = p
		  end

		  opts.on("-g", "--upgrade", "Run apt-get update") do |g|
		    @options[:upgrade] = g
		  end
		end

		@option_parser.parse! arguments

		@options
  	end

  	def get_summary
  		@option_parser.help()
  	end

  	def get_engine
  		@option_parser
  	end

  	def get_options
  		@options
  	end
  end
end