Voici un projet pour découvrir le framework Sinatra et avancer dans notre approche du MVC.

Il y aura 4 grandes parties, chacune correspondant à une classe (donc un fichier) :

- Le routeur
- Le controller
- La view
- La base de donnée (model)

Pour le moment, ne code rien. On va juste passer en revue chaque fichier pour bien te rappeler ce qu'ils vont chacun faire.

### Le routeur

Le travail du routeur sera simple : c'est de demander ce que l'utilisateur veut faire et de lancer la bonne méthode dans la bonne classe, en fonction.

Il y aura 3 choix : créer un gossip, voir la liste complète des gossips ou supprimer un gossip. Chaque action correspond à une méthode du controller.

### Le controller

Le controller servira de relai entre la view et le model. Il aura 3 méthodes : une qui gère la création d'un potin, une qui gère l'affichage de la liste des potins, et une qui permet de détruire un potin. Une fois l'action effectuée (via le model), la méthode devra renvoyer vers la view.

### La view

La view s'occupera d'afficher les bonnes informations à l'utilisateur. Comme on n'a pas encore vu les systèmes de fichiers HTML (on voit ça très bientôt 😉), on va coder ça sur le terminal avec des bons vieux `puts` en l'affichage et `gets.chomp` pour obtenir les ordres de l'utilisateur.

### Le model et la base de données

Un potin sans son contenu, eh bien c'est comme un hamburger sans pain. Vazy cé nul. Nous allons donc faire en sorte qu'un potin ait 2 attributs :

- son `content` qui est un string
- un `author` qui est aussi un string

C'est tout. On aurait pu ajouter d'autres choses (la date du potin par exemple), mais pour ce premier MVC on va faire simple.

Au final, le model sera une classe `Gossip` qui ira piocher dans la base de données (le CSV) et sortira des instances de type `Gossip`. Elles auront, tu l'as compris, 2 variables d'instance : un `content` et un `author`.
