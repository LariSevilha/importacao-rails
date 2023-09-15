require 'nokogiri'
require 'open-uri'

seed_file = File.new("como_importar_contatos_seed.rb", "w")

begin
  doc = Nokogiri::HTML(URI.open('https://www.agenciaw3.digital/ajuda/email-corporativo/email/tutorial/como-importar-contatos'))

  title = doc.css('div.title h3.text-center').text.strip
  date = doc.css('div.text-secondary.text-center').text.strip
  text_elements = doc.css('div.cb-text.medium-editor-element p')

  seed_file.puts "ComoImportarContatosTutorial.create(title: '#{title}', date: '#{date}')"

  text_elements.each do |text|
    content = text.text.strip
    seed_file.puts "ComoImportarContatosTutorialContent.create(tutorial_id: ComoImportarContatosTutorial.last.id, content: '#{content}')"
  end

  images = doc.css('div.cb-content figure.cb-figure img')
  image_urls = images.map { |image| image['src'] }

  image_urls.each_with_index do |url, index|
    seed_file.puts "Image.create(tutorial_id: ComoImportarContatosTutorial.last.id, url: '#{url}', caption: 'Imagem #{index + 1}')"
  end
rescue StandardError => e
  puts "Ocorreu um erro: #{e.message}"
ensure
  seed_file.close if seed_file
end
