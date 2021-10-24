require 'router'
require 'gossip'
require 'csv'
require 'view'

class Controller

    attr_accessor :view
    def initialize
        @view = View.new
    end

    def create_gossip
        params = @view.create_gossip
        gossip = Gossip.new(params[:content],params[:author])
        gossip.save
    end

    def index_gossips
        # .all c'est la fonction dans gossip.rb
        gossips_show = Gossip.all
        @view.index_gossips(gossips_show)
    end

    # A finir 
    def delete_gossip
        puts "quel gossip supprimer ?"
        puts CSV.read("db/gossip.csv")
        choice = gets.chomp
        CSV.foreach("./db/gossip.csv") do |ligne|
        ligne.delete_if{|x| x == choice}
       end
     
    end
end
