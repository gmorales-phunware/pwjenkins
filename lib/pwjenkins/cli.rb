require 'thor'
require 'pwjenkins'
require 'pwjenkins/installers/FOX/iOS'
require 'pwjenkins/installers/Errors/error'

def system!(*args)
  system(*args) || abort(''+red('\n== Command #{args} failed =="')+'')
end

module Pwjenkins
  class CLI < Thor
    check_unknown_options!
    def self.exit_on_failure?
    true
    end

    method_option :all, :aliases => "-all", :desc => "Build All Schemes after cloning repo."
    desc "[APP] -[scheme]", "CLI Installer for AF iOS "
    def app(name)
      scheme = options[:all]
      if name.downcase != "fox"
        error = "Incorrect App. Currently this only supports FOX"
        Pwjenkins::Installers::Error.start([error])
      end

      if scheme == "-all"
        Pwjenkins::Installers::FOX.start([branch, scheme])
      else
        Pwjenkins::Installers::FOX.start([branch, scheme])
      end
    end

  end
end
