require 'nokogiri'
require 'open-uri'

seed_file = File.new("tutorial_seed.rb", "w")

begin
  doc = Nokogiri::HTML(URI.open('https://agenciaw3.digital/ajuda/backup/tutoriais-para-backup'))  
 
  section = doc.css('section#services-category-page')
 
  divs = section.css('div.service-category')

  divs.each do |div|
    name = div.css('h2.text-center').text.strip
    img_src = div.css('img.img-fluid').first['src']
    links = div.css('ul li a')

    seed_file.puts "Category.create(name: '#{name}', img_src: '#{img_src}')"
    
    links.each do |link|
      title = link.text
      href = link['href']
      seed_file.puts "Tutorial.create(category_id: Category.last.id, title: '#{title}', href: '#{href}')"
    end
  end
rescue StandardError => e
  puts "Ocorreu um erro: #{e.message}"
ensure
  seed_file.close if seed_file
end
