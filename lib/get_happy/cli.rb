module GetHappy 
  class CLI  < Thor
    include Thor::Actions
    
    CAPTURE_COMMANDS_OUTPUT = !ENV['GH_CAPTURE_COMMANDS_OUTPUT'].nil?
    
    desc "version", "current version"
    def version
      say GetHappy::VERSION
    end
    
    desc "play", "play a random song"
    def play
      @collection ||= GetHappy.get_collection
      run("open #{@collection.sample}", :capture => CAPTURE_COMMANDS_OUTPUT) unless @collection.empty?
      say "Collection is empty! get_happy seed to seed" if @collection.empty?
    end
  
    
    desc "add [LINKS]", "add a link to collection" 
    def add(*links)
      @collection ||= GetHappy.get_collection
      links.each {|link| @collection << link.to_s}
      GetHappy.write_collection(@collection)
      list
    end
  
    desc "list", "list collection"
    def list  
      @collection = GetHappy.get_collection
      user =  `echo $USER`.gsub("\n", "")

      say " \n"
      say "\e[1m\e[4m#{user} Total #{@collection.size}\e[0m \n\n"
      @collection.each do |item|
        say "🚀  #{item}" , :green
      end
      say "\n"
    end

    desc "clean", "clean collection"
    def clean
      @collection = []
      GetHappy.write_collection([])
      say "Collection is empty", :green
    end
    
    desc "seed", "seed with some sample urls"
    def seed
      GetHappy.seed
      list
    end
    
    desc "delete", "delete a url"
    def delete(url)
      @collection = GetHappy.get_collection
      deleted = !!@collection.delete(url.to_s)
      GetHappy.write_collection(@collection)
      say deleted,  deleted ? :green : :red
    end


    # get_happy settings  --options=name:string age:integer
    desc "settings ", "get_happy settings  --options=repo:\"git@github.com:msroot/get_happy_sync.git\""
    method_option :options, :type => :hash, :default => {}, :required => true
    def settings      
      GetHappy.write_settings(options[:options])
      say GetHappy.get_settings
    end
    
    
    desc "sync", "saves the collection to a repo"
    def sync
      require 'git'
      remote_repo_url = GetHappy.get_settings["repo"]
      say("No repo added", :red) and return unless remote_repo_url 
      
      g = ::Git.open(GetHappy::COLLECTION_DIR) rescue nil
      say "Found existing repo " + g.repo.path if g
      
      unless g
        # ::Git.init(GetHappy::COLLECTION_DIR)
        IO.popen("cd #{GetHappy::COLLECTION_DIR} && git init") {|s| say s.read }
        IO.popen("echo \"*\n!collection.yml\" > #{GetHappy::COLLECTION_DIR}/.gitignore")
        g = ::Git.open(GetHappy::COLLECTION_DIR)
      end
      
      unless g.remotes.map(&:name).include?("remote")
        g.add_remote("remote", remote_repo_url)
      end
      
      if g.status.changed.keys.include?("collection.yml")
        g.add('collection.yml')
        g.commit("Sync collection at #{Time.now} (#{GetHappy.get_collection.size} items)", :force => true)
        g.push(g.remote('remote'))
        say  g.log[0].message , :green
      else
        say "Nothing to sync" , :green
      end
    end

    
    desc "import_playlist [ID]", "import a youtube playlist"
    def import_playlist(id)
      GetHappy.ensure_user_data!
      
      playlist = GetHappy.get_playlist(id)
      say "Found #{playlist.size} items"
      
      unless playlist.empty?        
        if yes?("Import playlist?", :green)
          GetHappy.write_collection(playlist)
          list
        end
      end
    
    end
    
  end
end
