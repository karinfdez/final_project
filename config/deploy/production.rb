# Here we call the whenever command for our application, and tell the Capistrano 
#to run at the end of the deployment process.
# namespace :deploy do
#   desc "Update crontab with whenever"
#   task :update_cron do
#     on roles(:app) do
#       within current_path do
#         execute :bundle, :exec, "whenever --update-crontab #{fetch(:application)}"
#       end
#     end
#   end

#   after :finishing, 'deploy:update_cron'
# end