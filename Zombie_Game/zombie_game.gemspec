#coding: utf-8
lib = File.expand_path('../lib', _FILE_)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
	spec.name = "Will's Zombie Game"
	spec.version = "1.0"
	spec.authors = "William R. Wilson"
	spec.email = "williamrwilson@gmail.com"
	spec.summary = "%q{Game created as a learning project for Ruby}"
	spec.description = "%q{This game was created as a way for me to learn about classes, 
	directory structure, etc}"
	spec.homepage = ""
	spec.license = ""

	spec.files = ["lib/NAME.rb"]
	spec.executables = ["bin/NAME"]
	spec.test_files = ["tests/test_GAME.rb"]
	spec.require_paths = ["lib"]
end