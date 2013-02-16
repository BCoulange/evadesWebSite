# Installation
* créer un fichier application.yml dans app/config et ajouter les id flickr et amazon :   

`FLICKR_API_KEY: "MY_FLICKR_KEY"`  
`FLICKR_SECRET: "MY_FLICKR_SECRET"`  
`FLICKR_EVADES_ID: "MY_FLICKR_ID"`  
`AWS_BUCKET:	"MY_AMAZON_S3_BUCKET"`  
`AWS_ACCESS_KEY_ID: "MY_ AMAZON_ACCESS_KEY"`  
`AWS_SECRET_ACCESS_KEY: "MY_AMAZON_SECRET"`  
`GMAIL_MAIL: "EMAIL_FROM"`
`GMAIL_PWD: "GMAIL_PASSWORD"`
`CONTACT_MAIL: "CONTACT_EMAIL"`

# TODO
## v1 : 
- [x] Gestion des évadés + page d'évadé
- [x] Gestion des spectacles + page de spectacle
- [x] Gestion des lieux + page de lieu
- [x] Affichage des lieux sur une carte Gmap
- [x] Affichage du prochain spectacle sur la home
- [x] Gestion du calendrier
- [x] Authentification nécessaire pour certaines pages
- [x] Lien entre les spectacles et les lieux
- [x] Générateur d'affiches qui récupère les infos du spectacle
- [x] Affiche générée à la volée pourles spectacles sans affiches
- [x] Gallerie qui récupère les derniers albums sur Flickr
- [x] Mise des images sur Amazon S3
- [x] Mailing lists
- [x] Téléchargement des affiches
- [x] Bouton « faire parti de la troupe »
- [x] Formulaire de contact
- [x] Gestion des news
- [x] Roles administrateur
- [x] Changement des noms des routes (lieus, users)
- [x] Mise en forme globale
- [ ] Rappel pour la com
- [ ] Gestion de Facebook
- [ ] Inclure les présentations d'évadés
- [ ] gestion des Petits, papiers, flechages et autres ressources
- [ ] Mettre en page affiche template et autres éléments d'admin

## v1.1
- [ ] Résumés des réunions CA sur le site web
- [ ] Envoi de mail du résumé
- [ ] Générateur de Flyer


# Liens 
* Formulaire de contact léger : http://matharvard.ca/posts/2011/aug/22/contact-form-in-rails-3/
* Gestion de Facebook : http://horserumble.com/creating-facebook-events-with-koala