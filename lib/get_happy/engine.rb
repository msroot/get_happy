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
    ensure_user_data!
    YAML::load_file(COLLECTION)
  end

  def get_playlist(id)
    url = "http://gdata.youtube.com/feeds/api/playlists/#{id}?v=2&alt=json"
    request = Net::HTTP.get_response(URI.parse(url))
    success = request.is_a? Net::HTTPSuccess
    data   = JSON.parse(request.body, :symbolize_names => true) if success
    success ? data[:feed][:entry].map {|e| e[:link].first[:href]} : []
  end
  
  def ensure_user_data!
    unless File.directory?(COLLECTION_DIR)
      FileUtils.mkdir_p(COLLECTION_DIR)
    end

    File.open(COLLECTION, "w") do |file|
      file.write [].to_yaml
    end unless File.file?(COLLECTION) 
  end  
  
end 

