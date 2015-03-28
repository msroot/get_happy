require "get_happy/version"
require "thor"
require 'yaml'
require 'fileutils'

module GetHappy 
  class CLI  < Thor
    
    desc "play", "play a random song"
    def play
      @collection ||= GetHappy.get_collection
      system("open", @collection.sample.to_s) unless @collection.empty?
      puts "Collection is empty! " +
      "add some links first: get_happy seed" if @collection.empty?
    end
  
  
    desc "add", "add a link to collection"
    def add(*links)
      
      @collection ||= GetHappy.get_collection
      
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


module GetHappy 
  extend self

  @seed = ["https://www.youtube.com/watch?v=s3Q80mk7bxE"]
  COLLECTION_DIR = Dir.home + '/.get_happy'
  COLLECTION_PATH = COLLECTION_DIR + "/collection.yml"
    
  def write_collection(collection)
    File.open(COLLECTION_PATH, "w") do |file|
      file.write collection.uniq.to_yaml
    end 
  end
  
  def seed
    write_collection get_collection + @seed
  end

  def get_collection
    unless File.directory?(COLLECTION_DIR)
      FileUtils.mkdir_p(COLLECTION_DIR)
    end

    File.open(COLLECTION_PATH, "w+") do |file|
      file.write @seed.to_yaml
    end unless File.file?(COLLECTION_PATH) 
    YAML::load_file(COLLECTION_PATH) || []  
  end

end 

# rake build install && get_happy play
# rake build install && get_happy list
# rake build install && get_happy seed
# rake build install && get_happy clean
# rake build install && get_happy add https://www.youtube.com/watch?v=s3Q80mk7bxE
# del ~/.get_happy