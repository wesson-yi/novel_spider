# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
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

# Export current PATH to the cron
env :PATH, ENV['PATH']
ENV.each { |k, v| env(k, v) }

# set :bundle_command, 'bundle exec'
# job_type :runner,  "cd :path && :bundle_command rails runner -e :environment ':task' :output"

set :output, './log/cron_log.log'

every 3.minutes do
  # runner 'RemindBooksContinued.perform'
end
