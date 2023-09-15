require 'nokogiri'
require 'open-uri'
require 'httparty' 
require 'net/http' 

# Função para validar imagem
def validate_image(url)
  begin
    response = Net::HTTP.get_response(URI.parse(url))
    if response.is_a?(Net::HTTPSuccess)
      return true
    else
      if response.code.to_i == 404
        puts "URL remoto inválido - 404 Not Found"
      else
        puts "URL remoto inválido - Código de resposta: #{response.code}"
      end
      return false
    end
  rescue SocketError => e
    puts "Erro ao verificar o URL remoto: #{e.message}"
    return false
  rescue StandardError => e
    puts "Erro inesperado: #{e.message}"
    return false
  end
end 
# Cria o arquivo de seed
seed_file = File.new("inserir_trocar_foto_seed.rb", "w")

begin
  doc = Nokogiri::HTML(URI.open('https://www.agenciaw3.digital/ajuda/email-corporativo/email/tutorial/inserir-ou-trocar-foto-no-webmail'))

  title = doc.css('div.title h3.text-center').text.strip
  date = doc.css('div.text-secondary.text-center').text.strip
  text_elements = doc.css('div.cb-text.medium-editor-element p')

  seed_file.puts "InserirTrocarFotoNoWebmailTutorial.create(title: '#{title}', date: '#{date}')"

  text_elements.each do |text|
    content = text.text.strip
    seed_file.puts "InserirTrocarFotoNoWebmailTutorialContent.create(tutorial_id: InserirTrocarFotoNoWebmailTutorial.last.id, content: '#{content}')"
  end

  images = doc.css('div.cb-content figure.cb-figure img')
  image_urls = images.map { |image| image['src'] }

  image_urls.each_with_index do |url, index|
    seed_file.puts "Image.create(tutorial_id: InserirTrocarFotoNoWebmailTutorial.last.id, url: '#{url}', caption: 'Imagem #{index + 1}')"
  end
 
rescue StandardError => e
  puts "Ocorreu um erro: #{e.message}"
ensure 
  seed_file.close
 
  seed_file.close if seed_file
end
