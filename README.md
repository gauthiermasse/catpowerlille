<h1>The Hacking Chaton-project </h1>
<h2>1. site d'Ecommerce</br>
@Kalejo<br>
@Ampuero Pierre<br>
@Guillaume<br>
@Gauthier<br>
@Louis-Elie<br>


thplille@gmail.com
</h2>




Voici le lien de notre app en production: 
https://chaton-project.herokuapp.com/

On a réussi à bien bosser tous ensemble grâce aux cartes Trello, notre site est donc fonctionnel avec en plus un dashboard admin pour voir les commandes et créer / modifier les items (nom, description et photo du chat). 

Nous avons utilisé le thème Bootstrap Boomerang pour notre site, et des url d'images Amazon pour les petits chats. 

	La homepage
La homepage t'accueille et te propose d'aller fouiner les plus belles photos de chats sur la page shop.

	La page shop
Notre index: ici tu retrouveras tous les items en vente. Accessible à tout moment sur le site depuis le lien "Les produits" dans la navbar. Tu peux accéder aux produits en cliquant dessus.

	La page show d'un produit
Lorsque tu cliques sur un item dans l'index, tu arrives sur la page show de ce produit. Tu peux l'ajouter à ton panier, que tu sois connecté ou en visiteur anonyme.

	La page panier
Ici tu retrouves tous les items que tu as ajouté au panier, en étant connecté ou non. Tu peux les enlever de ton panier. Si tu es connecté, tu peux alors passer au paiement par Stripe. Si tu n'es pas connecté, tu dois te connecter pour pouvoir payer (normal), et là INCROYABLE une fois connecté tu retrouves le panier que tu avais constitué en tant que visiteur anonyme. 
Une fois que tu as payé (n°carte 4242 4242 4242 4242, date random, crypto random), tu reçois un mail contenant l'image et te remerciant. 

	La page profil
Accessible depuis l'icône en haut à droite, tu peux modifier tes informations de profil et voir tes commandes passées.


	Admin
Pour voir les commandes des clients en tant qu'admin, logge toi avec les identifiants admin (thplille@gmail.com // mdp: thplille59) et tu peux alors aller sur https://chaton-project.herokuapp.com/orders qui référence toutes les commandes passées, et sur https://chaton-project.herokuapp.com/items pour ajouter / modifier / supprimer des items.

