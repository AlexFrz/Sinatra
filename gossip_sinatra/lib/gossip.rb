require 'bundler'
Bundler.require
require 'controller'

class Gossip
    attr_accessor :author, :content

	def initialize (author,content)
		@author = author
		@content = content
    
    def save
        CSV.open("/Users/AlexFrz/Desktop/gossip_sinatra/db/gossip.csv", "ab") do |csv|
            csv << [@author, @content]
      end
    end
    def self.all
        all_gossips_array = []
        CSV.read("./db/gossip.csv").each do |csv_line|
            all_gossips_array = [] << Gossip.new(csv_line[0], csv_line[1])
        end
        return all_gossips_array = []
      end
  
end
end

