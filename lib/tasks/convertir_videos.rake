#require 'rufus-scheduler'


#scheduler = Rufus::Scheduler.new

#scheduler.every '1m' do
#  puts 'Hello... Rufus'
#  VideosHelper.convert_videos()
#end

#scheduler.join

desc 'convertir videos a .mp4'
task convertir_videos: :environment do
  puts "entro a la tarea"
  VideosHelper.convert_videos()
end