require "nokogiri"
require "open-uri"

def web_scrap
    tv_shows_infos = []
    url = "https://www5.himovies.to/tv-show?page=10"
    html_file = URI.open(url).read
    html_doc = Nokogiri::HTML(html_file)
    exploit = html_doc.search(".film-detail-fix").first(6).each do |doc|
        name = doc.search(".film-name").text.strip
        season_and_e = doc.search(".fdi-item").text.strip
        tv_shows =  "|#{name}|#{season_and_e}|"
        tv_shows_infos << tv_shows
        tv_shows_infos
    end   
    return tv_shows_infos 
end

puts web_scrap