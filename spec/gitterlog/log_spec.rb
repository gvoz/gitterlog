require "spec_helper"

describe GitterLog::Log do

  let(:log) { GitterLog::Log.new }

  it "save files" do
    log.log_room(ENV["ROOM_ID"])
    expect(Dir["logs/#{ENV["ROOM_ID"]}*"].empty?).to be false
  end

  it "don't rewrite files" do
    file_name = Dir["logs/#{ENV["ROOM_ID"]}*"].last
    File.open(file_name, 'w') { |f| f.puts "rewrite file"}
    log.log_room(ENV["ROOM_ID"])
    expect(File.new(file_name).read.chomp).to eq("rewrite file")
  end

  it "don't save today messages" do
    date_message = DateTime.now.strftime("%Y_%m_%d")
    client = GitterLog::Client.new
    client.create_message(ENV["ROOM_ID"], {text: "test #{date_message}"})
    log.log_room(ENV["ROOM_ID"])
    expect(Dir["logs/#{ENV["ROOM_ID"]}_#{date_message}.txt"].empty?).to be true
  end
end
