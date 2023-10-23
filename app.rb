require 'bundler'
Bundler.require

$:.unshift File.expand_path("./../lib", __FILE__)
require 'controller.rb'
require 'gossip.rb'
require 'router.rb'
require 'view.rb'

Router.new.perform


binding.pry