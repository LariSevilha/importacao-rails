CriarFiltrosTutorial.create(title: 'Como criar um grupo de contatos', date: '04 / 02 / 2020')
CriarFiltrosTutorialContent.create(tutorial_id: CriarFiltrosTutorial.last.id, content: 'Como criar um grupo de contatos')
CriarFiltrosTutorialContent.create(tutorial_id: CriarFiltrosTutorial.last.id, content: 'Na aba “Contatos” do Webmail, na parte “Grupos“, selecione a categoria e clique em “Criar“:')
CriarFiltrosTutorialContent.create(tutorial_id: CriarFiltrosTutorial.last.id, content: 'Digite o nome do grupo e clique em “Salvar“:')
CriarFiltrosTutorialContent.create(tutorial_id: CriarFiltrosTutorial.last.id, content: 'Pronto! Seu grupo foi criado com sucesso!')
Image.create(tutorial_id: CriarFiltrosTutorial.last.id, url: 'https://cdn1.agenciaw3.digital//uploads/rails_admin_content_builder/content_builder_image/image/77/center_ComoCriarUmGrupoDeContatos1.jpg', caption: 'Imagem 1')
Image.create(tutorial_id: CriarFiltrosTutorial.last.id, url: 'https://cdn1.agenciaw3.digital//uploads/rails_admin_content_builder/content_builder_image/image/78/center_ComoCriarUmGrupoDeContatos2.jpg', caption: 'Imagem 2')
