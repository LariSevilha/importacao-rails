InserirAnexoTutorial.create(title: 'Inserir um anexo', date: '03 / 02 / 2020')
InserirAnexoTutorialContent.create(tutorial_id: InserirAnexoTutorial.last.id, content: 'Como inserir um anexo')
InserirAnexoTutorialContent.create(tutorial_id: InserirAnexoTutorial.last.id, content: 'Tamanho máximo de anexo via Webmail: 25 MB')
InserirAnexoTutorialContent.create(tutorial_id: InserirAnexoTutorial.last.id, content: 'Dentro do seu e-mail e na opção “Criar e-mail“, clique na aba “Anexar“:')
InserirAnexoTutorialContent.create(tutorial_id: InserirAnexoTutorial.last.id, content: 'Na opção anexar, o usuário pode arrastar o arquivo desejado ou usar a opção “Clique aqui” para achar o arquivo em seu computador:')
InserirAnexoTutorialContent.create(tutorial_id: InserirAnexoTutorial.last.id, content: 'Vá até o local do arquivo que deseja anexar, selecione ele e clique em “Abrir” e em seguida clique em “Enviar arquivo“:')
InserirAnexoTutorialContent.create(tutorial_id: InserirAnexoTutorial.last.id, content: 'Pronto! O arquivo está em anexo!')
Image.create(tutorial_id: InserirAnexoTutorial.last.id, url: 'https://cdn1.agenciaw3.digital//uploads/rails_admin_content_builder/content_builder_image/image/10/center_imagem1.jpg', caption: 'Imagem 1')
Image.create(tutorial_id: InserirAnexoTutorial.last.id, url: 'https://cdn1.agenciaw3.digital//uploads/rails_admin_content_builder/content_builder_image/image/11/center_imagem2.jpg', caption: 'Imagem 2')
Image.create(tutorial_id: InserirAnexoTutorial.last.id, url: 'https://cdn1.agenciaw3.digital//uploads/rails_admin_content_builder/content_builder_image/image/12/center_imagem3.jpg', caption: 'Imagem 3')
Image.create(tutorial_id: InserirAnexoTutorial.last.id, url: 'https://cdn1.agenciaw3.digital//uploads/rails_admin_content_builder/content_builder_image/image/13/center_imagem4.jpg', caption: 'Imagem 4')