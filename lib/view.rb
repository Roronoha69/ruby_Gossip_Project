class View

    def create_gossip
        puts "nom d'auteur :"
        auteur = gets.chomp

        puts "nom du contenu"
        contenu = gets.chomp

        return params = { content: contenu, author: auteur }
    end

    def index_gossips(gossips)
        #gossips c'est l'array all_gossips[] 
        gossips.each_with_index do |x|
        puts "Askip #{x.author} a dit que #{x.content}" 
        end
        
        # Y'a aussi : puts CSV.read(db/gossip.csv)
    end


end

