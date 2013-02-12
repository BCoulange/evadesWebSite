# encoding: utf-8

require 'date'

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Lieux de spectacle
lieux=Lieu.create!([{nom: 'Le Sonar(t)', street: '55 rue Pigalle', city: 'Paris', country: 'France'},
	{ nom: 'Télécom ParisTech', street: '45 rue Vergniaud', city: 'Paris', country: 'France'}])

# Evadés
evades=User.create!([{email: 'lemanipulant@ruebarrow.fr', password: '123456', password_confirmation: '123456', prenom: 'Gaétan', nom: 'Bucipotels', surnom: 'Gaétan le Manipulant',  avatar: File.open(File.join(Rails.root,'db','fixtures','avatars','avatar_gaetan.jpg'))  },
	{email: 'lecoupegorge@ruebarrow.fr', password: '123456', password_confirmation: '123456', prenom: 'Thomas', nom: 'Gambier', surnom: 'Georges le coupe-gorge',  avatar: File.open(File.join(Rails.root,'db','fixtures','avatars','avatar_george.jpg'))},
	{email: 'laboussole@ruebarrow.fr', password: '123456', password_confirmation: '123456', prenom: 'Julien', nom: 'Crétin', surnom: 'Jean-Paul la boussole',  avatar: File.open(File.join(Rails.root,'db','fixtures','avatars','avatar_jeanpaul.jpg'))},
	{email: 'laguillotine@ruebarrow.fr', password: '123456', password_confirmation: '123456', prenom: 'Muriel', nom: 'Ekovitch', surnom: 'Justine la guillotine',  avatar: File.open(File.join(Rails.root,'db','fixtures','avatars','avatar_justine.jpg'))},
	{email: 'lextorsion@ruebarrow.fr', password: '123456', password_confirmation: '123456', prenom: 'Marie', nom: 'Teyssandier', surnom: 'Marion l\'extorsion',  avatar: File.open(File.join(Rails.root,'db','fixtures','avatars','avatar_marion.jpg'))},
	{email: 'lesquive@ruebarrow.fr', password: '123456', password_confirmation: '123456', prenom: 'Yves', nom: 'Bénabou', surnom: 'Steeve l\'esquive',  avatar: File.open(File.join(Rails.root,'db','fixtures','avatars','avatar_steeve.jpg'))},
	{email: 'lapyromane@ruebarrow.fr', password: '123456', password_confirmation: '123456', prenom: 'Sophie', nom: 'Le liboux', surnom: 'Suzanne la pyromane',  avatar: File.open(File.join(Rails.root,'db','fixtures','avatars','avatar_suzanne.jpg'))},
	{email: 'letrombonne@ruebarrow.fr', password: '123456', password_confirmation: '123456', prenom: 'Pauline', nom: 'Calmé', surnom: 'Yvonne le trombone',  avatar: File.open(File.join(Rails.root,'db','fixtures','avatars','avatar_yvonne.jpg'))}])

# Spectacles
Spectacle.create!([{titre: 'Les Evadés et Houdini', start_time: DateTime.new(2013,2,15,20,0), lieu_id: lieux[0].id, user_ids: [evades[2].id,evades[1].id], affiche: File.open(File.join(Rails.root,'db','fixtures','affiches','20130215_Houdini.png')),teaser: 'Les évadés vont tâcher de percer le sercret de Houdini!', message: '  '},
	{titre: 'Les Evadés en Islande', start_time: DateTime.new(2013,1,30,20,0), lieu_id: lieux[1].id, user_ids: [evades[0].id,evades[1].id], affiche: File.open(File.join(Rails.root,'db','fixtures','affiches','20130130_Telecom.png')),teaser: 'A l\'assault des banques islandaises!', message: '   '},
	{titre: 'Les Evadés Chez les mayas', start_time: DateTime.new(2013,1,18,20,0), lieu_id: lieux[0].id, user_ids: [evades[2].id,evades[1].id], affiche: File.open(File.join(Rails.root,'db','fixtures','affiches','10130108_Mayas.png')),teaser: 'A nous le pouvoir de conviction des mayas', message: '   '},
	{titre: 'Les Evadés à Istambul', start_time: DateTime.new(2012,11,13,20,0), lieu_id: lieux[1].id, user_ids: [evades[0].id,evades[1].id], affiche: File.open(File.join(Rails.root,'db','fixtures','affiches','20121113_Istambul.jpg')),teaser: 'Entre deux continents...', message: '   '},
	{titre: 'Les Evadés aux Caraïbes', start_time: DateTime.new(2012,10,12,20,0), lieu_id: lieux[1].id, user_ids: [evades[0].id,evades[1].id], affiche: File.open(File.join(Rails.root,'db','fixtures','affiches','20121012_caraibes.png')),teaser: 'Des vacances bien méritées?', message: '   '},
	{titre: 'Les Evadés Chez mamie', start_time: DateTime.new(2013,3,29,20,0), lieu_id: lieux[0].id,  user_ids: [evades[0].id,evades[2].id], affiche: File.open(File.join(Rails.root,'db','fixtures','affiches','20130215_Houdini.png')),teaser: 'Les évadés vont tâcher de percer le sercret de Houdini!', message: '   '},
	{titre: 'Les Evadés dans ton cul', start_time: DateTime.new(2013,4,12,20,0), lieu_id: lieux[0].id, user_ids: [evades[0].id,evades[1].id], affiche: File.open(File.join(Rails.root,'db','fixtures','affiches','20130215_Houdini.png')),teaser: 'Les évadés vont tâcher de percer le sercret de Houdini!', message: '   '}])


# Templates
AfficheTemplate.create!([{nom: "fond batiments",dhheigh: 643, dhwidth: 4613, dhx: 151, dhy: 2866, lieuheigh: 1377, lieuwidth: 1956, lieux: 100, lieuy:5573, teaserheigh: 1759, teaserwidth: 2105, teaserx: 2668, teasery: 176, fond: File.open(File.join(Rails.root,'db','fixtures','templates','batiments.png'))}])



