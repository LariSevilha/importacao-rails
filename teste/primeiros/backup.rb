require 'nokogiri'
require 'open-uri'

seed_file = File.new("backup_seed.rb", "w")

begin
  doc = Nokogiri::HTML(URI.open('https://agenciaw3.digital/ajuda/backup'))

  div = doc.css('a.col-12.col-md-3.col-lg-2.text-decoration-none.mb-5')

  div.each do |card|
    name = card.css('h1').text.strip
    link = card['href']

    seed_file.puts "Model.create(name: '#{name}', link: '#{link}')"
  end
rescue StandardError => e
  puts "Ocorreu um erro: #{e.message}"
ensure
  seed_file.close if seed_file
end
