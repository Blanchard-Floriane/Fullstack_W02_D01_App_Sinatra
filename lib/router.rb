require 'controller'

#Le travail du routeur sera simple : c'est de demander ce que l'utilisateur veut faire et de lancer la bonne méthode dans la bonne classe, en fonction.

#Il y aura 3 choix : créer un gossip, voir la liste complète des gossips ou supprimer un gossip. Chaque action correspond à une méthode du controller.

class Router

  #On veut qu'un "Router.new" lancé par app.rb, crée automatique une instance "@controller" -> déclenchera déclencher la méthode adéquate
  def initialize
    @controller =  Controller.new
  end

  #Proces, on fera tjr un "Router.new.perform" dans app.rb => on définit donc perform.
  def perform
    puts "BIENVENUE DANS THE GOSSIP PROJECT"

    while true
      #menu
      puts "Que veux-tu faire ? \n1) Créer un gossip \n2) Afficher tous les potins \n4) Quitter l'app"
      print "> "
      params = gets.chomp.to_i #paramas est une convention d'écriture
      case params
      when 1
        puts "Tu as choisi de créer un gossip"
        @controller.create_gossip
      when 2
        puts "Tu as choisi d'afficher tous les gossips :"
        @controller.index_gossips
      when 3
        puts "Tu as choisi de supprimer un potin"
        @controller.destroy_gossip
      when 4
        puts "À bientôt !"
        break #Pour sortir de la boucle while
      else
        puts "Ce choix n'existe pas, merci de ressayer" #pour les choix non conformes -> d'où la boucle infinie
      end
    end
  end

end