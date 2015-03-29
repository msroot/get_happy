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
  
  it "should list" do
    out = capture_io{ GetHappy::CLI.start %w{ list} }.join ''
    expect(out).to match /Ioannis Total./
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
    expect(after.to_s).to match /u9h7Teiyvc8/
  end
  
end


