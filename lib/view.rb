#La view s'occupera d'afficher les bonnes informations à l'utilisateur. 

class View
  def create_gossip
    puts "Entrez le nom de l'auteur du gossip :"
    author = gets.chomp

    puts "Entrez le contenu du gossip :"
    content = gets.chomp

    return params = { content: content_que_tu_viens_de_demander, author: author_que_tu_viens_de_demander }
    #Bonne pratique : pour les interactions avec les utilisateurs, dans le web on utilise une variable qui s'appelle params et qui est sous le format hash
  end

  def index_gossips(gossips) #la view s'occupe d'afficher les gossips tel que...
    gossips.each do |gossip| #ici gossips représente une variable ARRAY
      puts "Auteur : #{gossip.author}"
      puts "Contenu : #{gossip.content}"
      puts "----------------------"
    end
  end

  def destroy_gossip
    puts "Quel gossip veux-tu mettre aux oubliettes ?"
    gossip = gets.chomp
    return gossip
    #à continuer
  end
end