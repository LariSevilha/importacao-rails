require 'nokogiri'
require 'open-uri'

seed_file = File.new("email_seed.rb", "w")

begin
  doc = Nokogiri::HTML(URI.open('https://agenciaw3.digital/ajuda/email-corporativo/email'))
 
  section = doc.css('section#services-category-page')
 
  divs = section.css('div.col-12.col-md-4.mb-5')

  divs.each do |div|
    title = div.css('h2.text-center').first.text.strip
    img_src = div.css('img.img-fluid').first['src']
    category = div.css('h2.text-dark').first.text.strip
    links = div.css('ul li a')

    seed_file.puts "Category.create(title: '#{title}', img_src: '#{img_src}', category: '#{category}')"

    links.each do |link|
      tutorial_title = link.text
      tutorial_href = link['href']
      seed_file.puts "Tutorial.create(category_id: Category.last.id, title: '#{tutorial_title}', href: '#{tutorial_href}')"
    end
  end
rescue StandardError => e
  puts "Ocorreu um erro: #{e.message}"
ensure
  seed_file.close if seed_file
end
