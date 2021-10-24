require 'pry'
require 'csv'

class Gossip

    attr_accessor :author, :content

    def initialize(author, content)
        @content = content
        @author = author
      end

      def save
        CSV.open("./db/gossip.csv", "a+") do |csv| #Mettre a+, Avec w ca remplace les truc d'avant
        csv << [@content,@author]
        end 
    end

    def self.all
        # 1)création d'un array vide qui s'appelle all_gossips
        # 2)chaque ligne de ton CSV.each do |ligne|
        # 2-a) gossip_provisoire = Gossip.new(paramètres de la ligne) - permet de créer un objet gossip
        # 2-b) all_gossips << gossip_provisoire - permet de rajouter le gossip provisoire au array
        #all_gossips << gossip_provisoire
        # 3)return all_gossips - on renvoie le résultat
         
        all_gossips = []
        CSV.foreach("./db/gossip.csv") do |ligne| #attention c'est foreach et pas each
         
        gossip_provisoire =  Gossip.new(ligne[0], ligne[1]) 
          
        all_gossips << gossip_provisoire
        end
        return all_gossips
      end

end