require 'nokogiri'
require 'open-uri'

seed_file = File.new("mensagem_de_ferias_seed.rb", "w")  

begin
  doc = Nokogiri::HTML(URI.open('https://www.agenciaw3.digital/ajuda/email-corporativo/email/tutorial/mensagem-de-ferias'))

  title = doc.css('div.title h3.text-center').text.strip
  date = doc.css('div.text-secondary.text-center').text.strip
  text_elements = doc.css('div.cb-text.medium-editor-element p')
  image_links = doc.css('div.cb-figure img')

  seed_file.puts "\n# Tutorial: #{title}\n"
  seed_file.puts "Tutorial.create(title: '#{title}', date: '#{date}')"

  text_elements.each do |text|
    content = text.text.strip
    seed_file.puts "TutorialContent.create(tutorial_id: Tutorial.last.id, content: '#{content}')"
  end

  image_links.each_with_index do |image, index|
    image_url = image['src']
    seed_file.puts "TutorialImage.create(tutorial_id: Tutorial.last.id, image_url: '#{image_url}', order: #{index + 1})"
  end
rescue StandardError => e
  puts "Ocorreu um erro: #{e.message}"
ensure
  seed_file.close if seed_file
end
