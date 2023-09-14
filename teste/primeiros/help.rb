require 'nokogiri'
require 'open-uri'

seed_file = File.new("help_seed.rb", "w")

begin
  doc = Nokogiri::HTML(URI.open('https://www.agenciaw3.digital/ajuda'))

  div = doc.css('div.ajuda__cards') 

  div.search('div.ajuda__card').each do |card|
    name = card.css('h6').text
    description = card.css('p').text
    
    seed_file.puts "Model.create(name: '#{name}', description: '#{description}')"
  end
rescue StandardError => e
  puts "Ocorreu um erro: #{e.message}"
ensure
  seed_file.close if seed_file
end
