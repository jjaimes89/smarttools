set :path, "/home/ubuntu/smarttools"
set :output, "/home/ubuntu/smarttools/logtask.log"
set :environment, "development"
every 2.minute do
  # specify the task name as a string
  rake 'convertir_videos'
end