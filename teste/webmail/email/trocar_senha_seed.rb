TrocarSenhaTutorial.create(title: 'Como trocar a senha', date: '03 / 02 / 2020')
TrocarSenhaTutorialContent.create(tutorial_id: TrocarSenhaTutorial.last.id, content: 'Senha')
TrocarSenhaTutorialContent.create(tutorial_id: TrocarSenhaTutorial.last.id, content: 'No menu “Configurações”, clique em “Senha”:')
TrocarSenhaTutorialContent.create(tutorial_id: TrocarSenhaTutorial.last.id, content: 'Aqui o usuário pode mudar a senha, basta digitar a senha atual, e escolher a nova:')
Image.create(tutorial_id: TrocarSenhaTutorial.last.id, url: 'https://cdn1.agenciaw3.digital//uploads/rails_admin_content_builder/content_builder_image/image/28/center_ComoTrocarASenha1.jpg', caption: 'Imagem 1')
Image.create(tutorial_id: TrocarSenhaTutorial.last.id, url: 'https://cdn1.agenciaw3.digital//uploads/rails_admin_content_builder/content_builder_image/image/29/center_ComoTrocarASenha2.jpg', caption: 'Imagem 2')