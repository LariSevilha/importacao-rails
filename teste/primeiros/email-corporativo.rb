require 'nokogiri'
require 'open-uri'

seed_file = File.new("email_corporativo_seed.rb", "w")

begin
  doc = Nokogiri::HTML(URI.open('https://agenciaw3.digital/ajuda/email-corporativo'))
 
  section = doc.css('section#help-category-page')
 
  anchors = section.css('a.text-decoration-none.mb-5')

  anchors.each do |anchor|
    name = anchor.css('h1.text-center').text.strip
    img_src = anchor.css('img.img-fluid').first['src']
    href = anchor['href']

    seed_file.puts "Category.create(name: '#{name}', img_src: '#{img_src}', href: '#{href}')"
  end
rescue StandardError => e
  puts "Ocorreu um erro: #{e.message}"
ensure
  seed_file.close if seed_file
end
