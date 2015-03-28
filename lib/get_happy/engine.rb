module GetHappy 
  extend self

  @urls =  %w(
  https://www.youtube.com/watch?v=s3Q80mk7bxE
  https://www.youtube.com/watch?v=LxDhlzJR4XQ
  https://www.youtube.com/watch?v=HqYnevHibaI
  https://www.youtube.com/watch?v=8kMZcA5oEAA
  )

  COLLECTION_DIR = Dir.home + '/.get_happy'
  COLLECTION = COLLECTION_DIR + "/collection.yml"
    
  def write_collection(collection)
    collection = collection.compact.uniq
    File.open(COLLECTION, "w") do |file|
      file.write collection.to_yaml
    end 
  end
  
  def seed
    write_collection get_collection + @urls
  end

  def get_collection
    unless File.directory?(COLLECTION_DIR)
      FileUtils.mkdir_p(COLLECTION_DIR)
    end

    File.open(COLLECTION, "w+") do |file|
      file.write [].to_yaml
    end unless File.file?(COLLECTION) 
    
    YAML::load_file(COLLECTION) || []  
  end

end 

