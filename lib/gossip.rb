require 'csv'

class Gossip
  attr_reader :author, :content #2 variables d'instance

  def initialize(author, content) #ces 2 variables deviennent des paramètres via la méthode initialize
    @content = content
    @author = author
  end

  def save #pour enregistrer dans la BDD
    CSV.open('./db/gossip.csv', 'ab') do |csv| #Le mode d'écriture ajout ('a' pour append) = Si le fichier n'existe pas, il sera créé. Si le fichier existe déjà, les nouvelles données seront ajoutées à la fin du fichier sans écraser les données existantes.
      csv << [@author, @content]
    end
  end

  def self.all
    all_gossips = [] # Crée un tableau vide pour stocker les potins

    CSV.foreach('./db/gossip.csv') do |row|
      author, content = row
      gossip_provisoire = Gossip.new(author, content) # Crée un objet gossip à partir des données du CSV
      all_gossips << gossip_provisoire # Ajoute le gossip provisoire à l'array
    end
    return all_gossips #renvoie le résultat
  end

  def destroy_gossip
    #to be defined
  end
end