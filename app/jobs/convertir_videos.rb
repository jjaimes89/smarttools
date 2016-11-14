#require 'rufus-scheduler'


#scheduler = Rufus::Scheduler.new

scheduler.every '1m' do
  puts 'Hello... Rufus'
  VideosHelper.convert_videos()
end

scheduler.join