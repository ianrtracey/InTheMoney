require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'fileutils'

PAGES_DIR='data/pages'
FileUtils.makedirs(PAGES_DIR)

BASE_URL = 'https://github.com/'
S_URL = 'caesar0301/awesome-public-datasets'

#agriculture
# Get index of most recent script:
index_page = Nokogiri::HTML(open(BASE_URL+S_URL))
p index_page
# contract_pages = index_page.css("div.title").map{ |x| x.css("a") }.flatten.map{|x| x['href']}
# contract_ids = contract_pages.map{ |x| x.split("/")[-1] }

# puts "Crawling index from #{contract_ids.first} to #{contract_ids.last}"
# contract_ids.each do |idx|
#   url = "#{BASE_URL}/#{S_URL}#{idx}"
#   puts "Getting #{url}"
#   retries = 2
#   begin
#   resp = Net::HTTP.get_response(URI.parse(url))
#   if resp.code.match('200')
#     fname = "#{PAGES_DIR}/#{idx}"
#     File.open(fname, 'w') do |ofile|
#       ofile.write(resp.body)
#     end
#     puts "Saved to #{fname}"
#   else
#     puts "\tNot a valid page"
#   end
# rescue StandardError=>e
#   puts "#{idx}: #{e}"
#     if retries > 0 
#       puts "Retrying #{retries.length} more times"
#       retries -= 1
#       sleep 40
#       retry
#     end  
#   else
#     sleep 0.5 + rand * 3.0
#   end
# end