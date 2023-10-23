require 'bundler'
Bundler.require

$:.unshift File.expand_path("./../lib", __FILE__) #prend en compte tous les fichiers dans dossier lib
require 'controller' 

#la mission de config.ru sera de lancer le serveur.

run ApplicationController #pour executer la class