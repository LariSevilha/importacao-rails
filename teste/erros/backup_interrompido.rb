require 'nokogiri'
require 'open-uri'

seed_file = File.new("backup_interrompido_seed.rb", "w")

begin
  doc = Nokogiri::HTML(URI.open('https://www.agenciaw3.digital/ajuda/backup/tutoriais-para-backup/tutorial/backup-interrompido'))

  title = doc.css('div.title h3.text-center').text.strip
  date = doc.css('div.text-secondary.text-center').text.strip
  text_elements = doc.css('div.cb-text.medium-editor-element p')

  seed_file.puts "BackupInterrompidoTutorial.create(title: '#{title}', date: '#{date}')"

  text_elements.each do |text|
    content = text.text.strip
    seed_file.puts "BackupInterrompidoTutorialContent.create(tutorial_id: BackupInterrompidoTutorial.last.id, content: '#{content}')"
  end
rescue StandardError => e
  puts "Ocorreu um erro: #{e.message}"
ensure
  seed_file.close if seed_file
end
