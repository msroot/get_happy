module GetHappy 
  class CLI  < Thor
    
    desc "play", "play a random song"
    def play
      @collection ||= GetHappy.get_collection
      system("open", @collection.sample.to_s) unless @collection.empty?
      puts "Collection is empty! " +
      "add some links first: get_happy seed" if @collection.empty?
    end
  
  
    desc "add [LINKS]", "add a link to collection"
    def add(*links)
      @collection = GetHappy.get_collection
      links.each {|link| @collection << link.to_s}
      GetHappy.write_collection(@collection)
      puts @collection.inspect
    end
    
  
    desc "list", "list collection"
    def list  
      @collection ||= GetHappy.get_collection
      puts @collection.inspect
    end

    desc "clean", "clean collection"
    def clean
      @collection = []
      GetHappy.write_collection([])
      puts @collection.inspect
    end
    
    desc "seed", "seed with some sample urls"
    def seed
      GetHappy.seed
      @collection = GetHappy.get_collection
      puts @collection.inspect
    end
    
  end
end