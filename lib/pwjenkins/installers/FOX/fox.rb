require 'thor/group'
require 'pathname'
require 'fileutils'
include FileUtils

module Pwjenkins
  module Installers
    class FOX < Thor::Group
      argument :branch, :type => :string
      argument :scheme, :type => :string
      include Thor::Actions

      def self.source_root
        File.dirname(__FILE__)
      end

      def clone_command
        branch = "#{branch}"
        scheme = "#{scheme}"

        # Create directory and change directory into created dir.
        FileUtils::mkdir "FOX-#{branch}-#{scheme}" unless File.exists?("FOX-#{branch}-#{scheme}")
        FileUtils.cd("FOX-#{branch}-#{scheme}", :verbose => false)
        puts Rainbow("== Cloning Repo ==").cyan
        system! 'git clone -b '+v+' repo url' unless File.exist?('main repo folder')
        puts Rainbow("== Cloning Succeeded ==").magenta
      end

      def dependency_install_command
        puts Rainbow("== Moving to project folder ==").cyan
        FileUtils.cd('repo folder', :verbose => false)
        puts Rainbow("== Folder is now repo folder ==").magenta

        puts Rainbow("== Attempting to run pod install ==").cyan
        system! 'pod install'
        puts Rainbow("== Cocoapod installation completed ==").magenta

      rescue NoMethodError => e
        puts Rainbow("== Something went wrong. Please try again. ==").red
        exit 1
      end

      def build_attmept
        avail_schemes = ["debug", "adhoc", "release"]
        puts Rainbow("== Attempting to build project ==").cyan
        system! 'xcodebuild -scheme '+scheme+' -workspace FOX.xcworkspace/ -archivePath /Path/To/Output/FOX.xcarchive | xcpretty'
        puts Rainbow("== Project built successfully ==").magenta

      rescue NoMethodError => e
        puts Rainbow("== Something went wrong. Please try again. ==").red
        exit 1
      end

      def export_archive
        puts Rainbow("== Attempting to export build ==").cyan
        system! "xcodebuild -exportArchive -archivePath /Path/To/Output/FOX.xcarchive -exportPath /Path/To/ipa/Output/Folder -exportOptionsPlist /Path/To/ExportOptions.plist | xcpretty"
        puts Rainbow("== Build exported successfully ==").magenta
      end

      def open_project_folder
        puts Rainbow("== Open project folder ==").cyan
        system! 'open .'
        puts Rainbow("== AF Installer process completed. Thank you ==").magenta
      end

    end
  end
end
