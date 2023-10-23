require 'csv'

class Gossip
  attr_reader :author, :content, :id #3 variables d'instance

  def initialize(author, content) #ces 2 variables deviennent des paramètres via la méthode initialize
    @content = content
    @author = author
    @id = id
  end

  def save #pour enregistrer dans la BDD
    CSV.open('./db/gossip.csv', 'ab') do |csv| #Le mode d'écriture ajout ('a' pour append) = Si le fichier n'existe pas, il sera créé. Si le fichier existe déjà, les nouvelles données seront ajoutées à la fin du fichier sans écraser les données existantes.
      csv << [@author, @content]
    end
  end

  def self.all
    all_gossips = [] # Crée un tableau vide pour stocker les potins
    CSV.read("./db/gossip.csv").each do |csv_line|
      all_gossips << Gossip.new(csv_line[0], csv_line[1]) #récupère colonnes 1 et 2 pour chaque ligne du csv 
    end
    return all_gossips #renvoie le résultat
  end

  def self.find(id)
    data = all()
    @id = id.to_i + 1
    if @id - 1  < 0 || id > data.length #si id négatif ou dépasse le nb de gossips dispos
      return [nil, nil , nil]
    else 
      return [@id.to_s,data[@id-1].content,data[@id-1].author]
    end
  end

  def destroy_gossip
    #to be defined
  end
end