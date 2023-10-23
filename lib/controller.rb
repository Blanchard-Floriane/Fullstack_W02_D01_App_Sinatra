require 'gossip' #car le controller joue avec le model et la view
#require 'view'
require 'sinatra'
require 'puma'
require 'rerun'

class ApplicationController < Sinatra::Base #pour hériter des fonctionnalités de base de sinatra
  get '/' do #si qq1 va sur l'URL tu fais...
    erb :index, locals: {gossips: Gossip.all} #locals pour envoyer des variables au fichier ERB. Ici un array obtenu avec Gossip.all
  end

  get '/gossips/new/' do #pour gérer l'affichage du formulaire
    erb :new_gossip
  end

  post '/gossips/new/' do #post équivalent à gets.chomp
    Gossip.new(params["gossip_author"], params["gossip_content"]).save
    # Crée une instance de Gossip avec les données du formulaire
    # Demande au model de l'inscrire dans le CSV, en créant une nouvelle ligne dans mon fichier CSV
    #Save => car le contenu de params ne persiste que d’une page sur l’autre. Le hash se vide à chaque requête HTTP
    redirect '/' #pour rediriger vers l'accueil
  end
  
  get '/gossips/:id' do #va chercher le gossip spécifique fonction Id
    gossip = Gossip.find(params[:id])
    
    if !gossip[0] #si Id correspond à rien = Gossip n'existe pas
      redirect '/'
    else
      erb :show, locals: {gossip: Gossip.find(params['id'])} #permettra l'affichage spécfique de ce gossip dans show.erb
    end
  end

end





# class Controller

#   def initialize
#     @view =  View.new
#   end

#   def create_gossip
#     params = @view.create_gossip
#     gossip = Gossip.new(params[:author], params[:content]) 
#     gossip.save 
#   end

#   def index_gossips
#     gossips = Gossip.all # Utilise la méthode self.all de la classe Gossip pour obtenir une array avec tous les potins
#     @view.index_gossips(gossips) # Appelle la View (via une méthode de la View) => affiche les potins
#   end

#   def destroy_gossip
#     #params = 
#     @view.destroy_gossip
#   end
# end