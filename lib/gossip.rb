require 'csv'

class Gossip
  attr_reader :author, :content, :id #3 variables d'instance

  def initialize(author, content) #ces 2 variables deviennent des paramètres via la méthode initialize
    @content = content
    @author = author
    @id = generate_unique_id
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

  def generate_unique_id
    SecureRandom.uuid # Utilisez SecureRandom pour générer un UUID unique
  end

  def self.find(id) #recherche le gossip par rapport à un ID unique créé dans la méthode generate_unique_id
    data = all()
    gossip = data.find { |g| g.id == id }
    return gossip
  end

end