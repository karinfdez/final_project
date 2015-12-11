# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
set :output, "/Users/karinfernandez/Desktop/IronHack/Ironhack_bootcamp/final_project/art_project/log/cron_log.log"
set :path, Dir.pwd
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

#Hide events that are due
# job_type :awesome, '/usr/local/bin/awesome :task :fun_level'

# namespace :tutor do
#   desc 'A simple task'
#   task :simple => :environment do
#     puts 'I am a simple task'
#   end
# end


# every :hour do 
# 	#Class.method_name
#   runner "Event.delete_old_events"
# end


every 1.minute do
	 runner "puts #{:path}"
end
