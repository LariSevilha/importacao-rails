CriarFiltrosTutorial.create(title: 'Como criar um contato', date: '04 / 02 / 2020')
CriarFiltrosTutorialContent.create(tutorial_id: CriarFiltrosTutorial.last.id, content: 'Como criar um contato')
CriarFiltrosTutorialContent.create(tutorial_id: CriarFiltrosTutorial.last.id, content: 'Na aba “Contatos” do Webmail, selecione a pasta que deseja adicionar o contato e clique em “Criar”:')
CriarFiltrosTutorialContent.create(tutorial_id: CriarFiltrosTutorial.last.id, content: 'Digite todas as informações do contato e clique em “Salvar“:')
CriarFiltrosTutorialContent.create(tutorial_id: CriarFiltrosTutorial.last.id, content: 'Pronto! Seu contato foi adicionado com sucesso!')
Image.create(tutorial_id: CriarFiltrosTutorial.last.id, url: 'https://cdn1.agenciaw3.digital//uploads/rails_admin_content_builder/content_builder_image/image/69/center_1.jpg', caption: 'Imagem 1')
Image.create(tutorial_id: CriarFiltrosTutorial.last.id, url: 'https://cdn1.agenciaw3.digital//uploads/rails_admin_content_builder/content_builder_image/image/70/center_2.jpg', caption: 'Imagem 2')