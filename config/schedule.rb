# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Clear cron: crontab -r
# update cron: whenever --update-crontab
# update cron development: whenever --update-crontab --set environment-'development'

set :output, "./log/cron.log"
#
every 1.day at: '12:00 pm' do
#   command "/usr/bin/some_great_command"
  runner "EmailSender.send_scheduled_emails"
#   rake "some:great:rake:task"
end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever
