require 'spec_helper'




describe GetHappy do
  before(:each) do
    FileUtils.rm_rf(GetHappy::COLLECTION_DIR)
  end  

  it 'create directories' do
    expect(File.directory?(GetHappy::COLLECTION_DIR)).to be false
    expect(File.file?(GetHappy::COLLECTION)).to be false
    out = capture_io{ GetHappy::CLI.start %w{ list} }.join ''
    expect(File.directory?(GetHappy::COLLECTION_DIR)).to be true
    expect(File.file?(GetHappy::COLLECTION)).to be true
  end


  it "methods" do
    script = GetHappy::CLI.new
    script.respond_to? :add
    %i(add  clean  delete  list  play  seed).each do |method|
      expect(script.methods).to include method
      expect(script).to respond_to method
    end
  end

  it "should list" do
    out = capture_io{ GetHappy::CLI.start %w{ list} }.join ''
    expect(out).to match /Ioannis Total./
  end


  it "should delete" do
    GetHappy::CLI.start %w{ }
    expect(YAML::load_file(GetHappy::COLLECTION)).to be_empty
    GetHappy::CLI.start %w{ add https://www.youtube.com/watch?v=u9h7Teiyvc8}
    expect(YAML::load_file(GetHappy::COLLECTION)).to include("https://www.youtube.com/watch?v=u9h7Teiyvc8")

    GetHappy::CLI.start %w{ delete https://www.youtube.com/watch?v=u9h7Teiyvc8}
    expect(YAML::load_file(GetHappy::COLLECTION)).not_to include("https://www.youtube.com/watch?v=u9h7Teiyvc8")
  end

  it "should clean" do
    GetHappy::CLI.start %w{ seed}
    expect(YAML::load_file(GetHappy::COLLECTION)).not_to be_empty
    GetHappy::CLI.start %w{ clean}
    expect(YAML::load_file(GetHappy::COLLECTION)).to be_empty
  end

  it "should play" do
    GetHappy::CLI.start %w{ seed}

    out, err = capture_io do
      GetHappy::CLI.start %w{ play}
    end

    expect(out.strip).to include "run  open https://www.youtube.com/watch?v="
    expect(err).to be_empty
  end


  it "should seed" do
    GetHappy::CLI.start %w{}
    expect(YAML::load_file(GetHappy::COLLECTION)).to be_empty
    GetHappy::CLI.start %w{ seed}
    expect(YAML::load_file(GetHappy::COLLECTION)).not_to be_empty
  end

  it "should add" do
    GetHappy::CLI.start %w{}
    before = YAML::load_file(GetHappy::COLLECTION)
    GetHappy::CLI.start %w{ add https://www.youtube.com/watch?v=u9h7Teiyvc8}
    after = YAML::load_file(GetHappy::COLLECTION)

    expect(before).to_not be after
    expect(after.first).to match /u9h7Teiyvc8/
  end



  it "should not add duplicates" do
    GetHappy::CLI.start %w{ add https://www.youtube.com/watch?v=u9h7Teiyvc8}
    expect(YAML::load_file(GetHappy::COLLECTION).size).to eq 1
    GetHappy::CLI.start %w{ add https://www.youtube.com/watch?v=u9h7Teiyvc8}
    expect(YAML::load_file(GetHappy::COLLECTION).size).to eq 1
  end

  it "should import list" do
    allow_any_instance_of(Thor::Actions).to receive(:yes?).and_return(true)

    id = "B2A4E1367126848D"
    playlist = GetHappy.get_playlist(id)
    GetHappy::CLI.start %w{ import_playlist B2A4E1367126848D}

    expect(YAML::load_file(GetHappy::COLLECTION).size).to eq playlist.size
  end
  
end
