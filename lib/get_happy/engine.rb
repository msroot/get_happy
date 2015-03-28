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
