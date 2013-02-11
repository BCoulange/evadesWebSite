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
Spectacle.create!([{titre: 'Les Evadés et Houdini', start_time: DateTime.new(2013,2,15,20,0), lieu_id: lieux[0].id, user_ids: [evades[2].id,evades[1].id], affiche: File.open(File.join(Rails.root,'db','fixtures','affiches','20130215_Houdini.png')), message: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi viverra viverra dui, nec porttitor augue cursus eu. Proin luctus, turpis aliquam dictum euismod, mi lacus aliquet nibh, eu fringilla massa mauris sed purus. Duis dapibus, lectus quis pretium mattis, justo orci adipiscing tellus, non molestie lorem dolor eu dolor. Integer rutrum tempus urna vel semper. Nulla lacus lorem, luctus quis sagittis sed, fringilla quis sem. Praesent sem nunc, faucibus in mattis sed, sodales vel lorem. Pellentesque nec aliquam eros. Etiam nec ligula urna, et dapibus lectus. Suspendisse potenti. Phasellus rhoncus condimentum porta. Integer sed lorem lectus. Maecenas iaculis purus blandit nulla malesuada tincidunt. Morbi nec mi ac odio lobortis egestas ut ut elit. Vestibulum dictum euismod odio quis mattis. In pulvinar metus sed orci malesuada hendrerit mollis ligula dictum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aliquam tortor eros, fringilla sit amet dignissim eget, sodales id magna. Curabitur orci mi, porttitor eget suscipit laoreet, pharetra non ante. Etiam ligula lacus, eleifend nec auctor eu, pharetra ac magna. Vivamus non lacus et felis hendrerit dapibus. Suspendisse potenti. Ut eu erat sed justo consectetur ultrices. Curabitur odio erat, feugiat ut euismod nec, hendrerit ut tortor. Maecenas a odio eget est pretium vehicula in non est. Nulla facilisi. Praesent mattis, nisl in egestas posuere, nulla nisl egestas augue, sed lobortis libero leo vel nibh. Maecenas porta, libero at placerat hendrerit, purus diam sodales purus, sit amet consectetur nisl urna eu libero. Donec eget nulla est, a dapibus dolor. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vestibulum sed nisi metus. Nunc rutrum sapien quis magna semper vel varius nunc sodales. Donec porta quam a tortor tempus placerat. Integer mattis ullamcorper varius. Quisque vulputate elementum erat a tempus. Quisque condimentum sapien et est posuere semper. Fusce vitae ipsum quis nulla iaculis faucibus in quis nulla. Aenean scelerisque venenatis adipiscing. Donec at est lectus, sed accumsan neque. Donec leo nulla, vulputate nec tempor a, ultricies sit amet tellus. Aenean quam metus, porta a iaculis aliquet, ornare a lacus. Donec non purus nec sem mollis aliquet. Nulla facilisi. Vestibulum lacinia lacinia nunc, non fermentum enim sollicitudin eget. Aenean rutrum, tortor a venenatis venenatis, ipsum tellus mattis ante, a feugiat lorem eros ut turpis. Nullam libero dui, venenatis vel tristique id, semper nec justo. In et consequat ipsum. Suspendisse porta, augue non egestas dapibus, orci turpis porttitor nibh, faucibus dignissim lacus diam a velit. Morbi lobortis feugiat tempus.Proin et ante magna. Integer dignissim feugiat adipiscing. Fusce malesuada commodo est ac viverra. Integer aliquam dolor eu nisi rutrum euismod. Donec venenatis consectetur tincidunt. Proin vel metus mauris, quis hendrerit libero. Integer turpis nibh, tincidunt vel auctor nec, tempor et massa. Pellentesque bibendum nisi ac mauris varius venenatis nec et sapien.'},
	{titre: 'Les Evadés en Islande', start_time: DateTime.new(2013,1,30,20,0), lieu_id: lieux[1].id, user_ids: [evades[0].id,evades[1].id], affiche: File.open(File.join(Rails.root,'db','fixtures','affiches','20130130_Telecom.png')), message: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi viverra viverra dui, nec porttitor augue cursus eu. Proin luctus, turpis aliquam dictum euismod, mi lacus aliquet nibh, eu fringilla massa mauris sed purus. Duis dapibus, lectus quis pretium mattis, justo orci adipiscing tellus, non molestie lorem dolor eu dolor. Integer rutrum tempus urna vel semper. Nulla lacus lorem, luctus quis sagittis sed, fringilla quis sem. Praesent sem nunc, faucibus in mattis sed, sodales vel lorem. Pellentesque nec aliquam eros. Etiam nec ligula urna, et dapibus lectus. Suspendisse potenti. Phasellus rhoncus condimentum porta. Integer sed lorem lectus. Maecenas iaculis purus blandit nulla malesuada tincidunt. Morbi nec mi ac odio lobortis egestas ut ut elit. Vestibulum dictum euismod odio quis mattis. In pulvinar metus sed orci malesuada hendrerit mollis ligula dictum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aliquam tortor eros, fringilla sit amet dignissim eget, sodales id magna. Curabitur orci mi, porttitor eget suscipit laoreet, pharetra non ante. Etiam ligula lacus, eleifend nec auctor eu, pharetra ac magna. Vivamus non lacus et felis hendrerit dapibus. Suspendisse potenti. Ut eu erat sed justo consectetur ultrices. Curabitur odio erat, feugiat ut euismod nec, hendrerit ut tortor. Maecenas a odio eget est pretium vehicula in non est. Nulla facilisi. Praesent mattis, nisl in egestas posuere, nulla nisl egestas augue, sed lobortis libero leo vel nibh. Maecenas porta, libero at placerat hendrerit, purus diam sodales purus, sit amet consectetur nisl urna eu libero. Donec eget nulla est, a dapibus dolor. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vestibulum sed nisi metus. Nunc rutrum sapien quis magna semper vel varius nunc sodales. Donec porta quam a tortor tempus placerat. Integer mattis ullamcorper varius. Quisque vulputate elementum erat a tempus. Quisque condimentum sapien et est posuere semper. Fusce vitae ipsum quis nulla iaculis faucibus in quis nulla. Aenean scelerisque venenatis adipiscing. Donec at est lectus, sed accumsan neque. Donec leo nulla, vulputate nec tempor a, ultricies sit amet tellus. Aenean quam metus, porta a iaculis aliquet, ornare a lacus. Donec non purus nec sem mollis aliquet. Nulla facilisi. Vestibulum lacinia lacinia nunc, non fermentum enim sollicitudin eget. Aenean rutrum, tortor a venenatis venenatis, ipsum tellus mattis ante, a feugiat lorem eros ut turpis. Nullam libero dui, venenatis vel tristique id, semper nec justo. In et consequat ipsum. Suspendisse porta, augue non egestas dapibus, orci turpis porttitor nibh, faucibus dignissim lacus diam a velit. Morbi lobortis feugiat tempus.Proin et ante magna. Integer dignissim feugiat adipiscing. Fusce malesuada commodo est ac viverra. Integer aliquam dolor eu nisi rutrum euismod. Donec venenatis consectetur tincidunt. Proin vel metus mauris, quis hendrerit libero. Integer turpis nibh, tincidunt vel auctor nec, tempor et massa. Pellentesque bibendum nisi ac mauris varius venenatis nec et sapien.'},
	{titre: 'Les Evadés Chez les mayas', start_time: DateTime.new(2013,1,18,20,0), lieu_id: lieux[0].id, user_ids: [evades[2].id,evades[1].id], affiche: File.open(File.join(Rails.root,'db','fixtures','affiches','10130108_Mayas.png')), message: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi viverra viverra dui, nec porttitor augue cursus eu. Proin luctus, turpis aliquam dictum euismod, mi lacus aliquet nibh, eu fringilla massa mauris sed purus. Duis dapibus, lectus quis pretium mattis, justo orci adipiscing tellus, non molestie lorem dolor eu dolor. Integer rutrum tempus urna vel semper. Nulla lacus lorem, luctus quis sagittis sed, fringilla quis sem. Praesent sem nunc, faucibus in mattis sed, sodales vel lorem. Pellentesque nec aliquam eros. Etiam nec ligula urna, et dapibus lectus. Suspendisse potenti. Phasellus rhoncus condimentum porta. Integer sed lorem lectus. Maecenas iaculis purus blandit nulla malesuada tincidunt. Morbi nec mi ac odio lobortis egestas ut ut elit. Vestibulum dictum euismod odio quis mattis. In pulvinar metus sed orci malesuada hendrerit mollis ligula dictum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aliquam tortor eros, fringilla sit amet dignissim eget, sodales id magna. Curabitur orci mi, porttitor eget suscipit laoreet, pharetra non ante. Etiam ligula lacus, eleifend nec auctor eu, pharetra ac magna. Vivamus non lacus et felis hendrerit dapibus. Suspendisse potenti. Ut eu erat sed justo consectetur ultrices. Curabitur odio erat, feugiat ut euismod nec, hendrerit ut tortor. Maecenas a odio eget est pretium vehicula in non est. Nulla facilisi. Praesent mattis, nisl in egestas posuere, nulla nisl egestas augue, sed lobortis libero leo vel nibh. Maecenas porta, libero at placerat hendrerit, purus diam sodales purus, sit amet consectetur nisl urna eu libero. Donec eget nulla est, a dapibus dolor. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vestibulum sed nisi metus. Nunc rutrum sapien quis magna semper vel varius nunc sodales. Donec porta quam a tortor tempus placerat. Integer mattis ullamcorper varius. Quisque vulputate elementum erat a tempus. Quisque condimentum sapien et est posuere semper. Fusce vitae ipsum quis nulla iaculis faucibus in quis nulla. Aenean scelerisque venenatis adipiscing. Donec at est lectus, sed accumsan neque. Donec leo nulla, vulputate nec tempor a, ultricies sit amet tellus. Aenean quam metus, porta a iaculis aliquet, ornare a lacus. Donec non purus nec sem mollis aliquet. Nulla facilisi. Vestibulum lacinia lacinia nunc, non fermentum enim sollicitudin eget. Aenean rutrum, tortor a venenatis venenatis, ipsum tellus mattis ante, a feugiat lorem eros ut turpis. Nullam libero dui, venenatis vel tristique id, semper nec justo. In et consequat ipsum. Suspendisse porta, augue non egestas dapibus, orci turpis porttitor nibh, faucibus dignissim lacus diam a velit. Morbi lobortis feugiat tempus.Proin et ante magna. Integer dignissim feugiat adipiscing. Fusce malesuada commodo est ac viverra. Integer aliquam dolor eu nisi rutrum euismod. Donec venenatis consectetur tincidunt. Proin vel metus mauris, quis hendrerit libero. Integer turpis nibh, tincidunt vel auctor nec, tempor et massa. Pellentesque bibendum nisi ac mauris varius venenatis nec et sapien.'},
	{titre: 'Les Evadés Chez mamie', start_time: DateTime.new(2013,3,29,20,0), lieu_id: lieux[0].id,  user_ids: [evades[0].id,evades[2].id], affiche: File.open(File.join(Rails.root,'db','fixtures','affiches','20130215_Houdini.png')), message: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi viverra viverra dui, nec porttitor augue cursus eu. Proin luctus, turpis aliquam dictum euismod, mi lacus aliquet nibh, eu fringilla massa mauris sed purus. Duis dapibus, lectus quis pretium mattis, justo orci adipiscing tellus, non molestie lorem dolor eu dolor. Integer rutrum tempus urna vel semper. Nulla lacus lorem, luctus quis sagittis sed, fringilla quis sem. Praesent sem nunc, faucibus in mattis sed, sodales vel lorem. Pellentesque nec aliquam eros. Etiam nec ligula urna, et dapibus lectus. Suspendisse potenti. Phasellus rhoncus condimentum porta. Integer sed lorem lectus. Maecenas iaculis purus blandit nulla malesuada tincidunt. Morbi nec mi ac odio lobortis egestas ut ut elit. Vestibulum dictum euismod odio quis mattis. In pulvinar metus sed orci malesuada hendrerit mollis ligula dictum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aliquam tortor eros, fringilla sit amet dignissim eget, sodales id magna. Curabitur orci mi, porttitor eget suscipit laoreet, pharetra non ante. Etiam ligula lacus, eleifend nec auctor eu, pharetra ac magna. Vivamus non lacus et felis hendrerit dapibus. Suspendisse potenti. Ut eu erat sed justo consectetur ultrices. Curabitur odio erat, feugiat ut euismod nec, hendrerit ut tortor. Maecenas a odio eget est pretium vehicula in non est. Nulla facilisi. Praesent mattis, nisl in egestas posuere, nulla nisl egestas augue, sed lobortis libero leo vel nibh. Maecenas porta, libero at placerat hendrerit, purus diam sodales purus, sit amet consectetur nisl urna eu libero. Donec eget nulla est, a dapibus dolor. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vestibulum sed nisi metus. Nunc rutrum sapien quis magna semper vel varius nunc sodales. Donec porta quam a tortor tempus placerat. Integer mattis ullamcorper varius. Quisque vulputate elementum erat a tempus. Quisque condimentum sapien et est posuere semper. Fusce vitae ipsum quis nulla iaculis faucibus in quis nulla. Aenean scelerisque venenatis adipiscing. Donec at est lectus, sed accumsan neque. Donec leo nulla, vulputate nec tempor a, ultricies sit amet tellus. Aenean quam metus, porta a iaculis aliquet, ornare a lacus. Donec non purus nec sem mollis aliquet. Nulla facilisi. Vestibulum lacinia lacinia nunc, non fermentum enim sollicitudin eget. Aenean rutrum, tortor a venenatis venenatis, ipsum tellus mattis ante, a feugiat lorem eros ut turpis. Nullam libero dui, venenatis vel tristique id, semper nec justo. In et consequat ipsum. Suspendisse porta, augue non egestas dapibus, orci turpis porttitor nibh, faucibus dignissim lacus diam a velit. Morbi lobortis feugiat tempus.Proin et ante magna. Integer dignissim feugiat adipiscing. Fusce malesuada commodo est ac viverra. Integer aliquam dolor eu nisi rutrum euismod. Donec venenatis consectetur tincidunt. Proin vel metus mauris, quis hendrerit libero. Integer turpis nibh, tincidunt vel auctor nec, tempor et massa. Pellentesque bibendum nisi ac mauris varius venenatis nec et sapien.'},
	{titre: 'Les Evadés dans ton cul', start_time: DateTime.new(2013,4,12,20,0), lieu_id: lieux[0].id, user_ids: [evades[0].id,evades[1].id], affiche: File.open(File.join(Rails.root,'db','fixtures','affiches','20130215_Houdini.png')), message: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi viverra viverra dui, nec porttitor augue cursus eu. Proin luctus, turpis aliquam dictum euismod, mi lacus aliquet nibh, eu fringilla massa mauris sed purus. Duis dapibus, lectus quis pretium mattis, justo orci adipiscing tellus, non molestie lorem dolor eu dolor. Integer rutrum tempus urna vel semper. Nulla lacus lorem, luctus quis sagittis sed, fringilla quis sem. Praesent sem nunc, faucibus in mattis sed, sodales vel lorem. Pellentesque nec aliquam eros. Etiam nec ligula urna, et dapibus lectus. Suspendisse potenti. Phasellus rhoncus condimentum porta. Integer sed lorem lectus. Maecenas iaculis purus blandit nulla malesuada tincidunt. Morbi nec mi ac odio lobortis egestas ut ut elit. Vestibulum dictum euismod odio quis mattis. In pulvinar metus sed orci malesuada hendrerit mollis ligula dictum. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aliquam tortor eros, fringilla sit amet dignissim eget, sodales id magna. Curabitur orci mi, porttitor eget suscipit laoreet, pharetra non ante. Etiam ligula lacus, eleifend nec auctor eu, pharetra ac magna. Vivamus non lacus et felis hendrerit dapibus. Suspendisse potenti. Ut eu erat sed justo consectetur ultrices. Curabitur odio erat, feugiat ut euismod nec, hendrerit ut tortor. Maecenas a odio eget est pretium vehicula in non est. Nulla facilisi. Praesent mattis, nisl in egestas posuere, nulla nisl egestas augue, sed lobortis libero leo vel nibh. Maecenas porta, libero at placerat hendrerit, purus diam sodales purus, sit amet consectetur nisl urna eu libero. Donec eget nulla est, a dapibus dolor. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vestibulum sed nisi metus. Nunc rutrum sapien quis magna semper vel varius nunc sodales. Donec porta quam a tortor tempus placerat. Integer mattis ullamcorper varius. Quisque vulputate elementum erat a tempus. Quisque condimentum sapien et est posuere semper. Fusce vitae ipsum quis nulla iaculis faucibus in quis nulla. Aenean scelerisque venenatis adipiscing. Donec at est lectus, sed accumsan neque. Donec leo nulla, vulputate nec tempor a, ultricies sit amet tellus. Aenean quam metus, porta a iaculis aliquet, ornare a lacus. Donec non purus nec sem mollis aliquet. Nulla facilisi. Vestibulum lacinia lacinia nunc, non fermentum enim sollicitudin eget. Aenean rutrum, tortor a venenatis venenatis, ipsum tellus mattis ante, a feugiat lorem eros ut turpis. Nullam libero dui, venenatis vel tristique id, semper nec justo. In et consequat ipsum. Suspendisse porta, augue non egestas dapibus, orci turpis porttitor nibh, faucibus dignissim lacus diam a velit. Morbi lobortis feugiat tempus.Proin et ante magna. Integer dignissim feugiat adipiscing. Fusce malesuada commodo est ac viverra. Integer aliquam dolor eu nisi rutrum euismod. Donec venenatis consectetur tincidunt. Proin vel metus mauris, quis hendrerit libero. Integer turpis nibh, tincidunt vel auctor nec, tempor et massa. Pellentesque bibendum nisi ac mauris varius venenatis nec et sapien.'}])
