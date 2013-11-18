set :output, {:error => 'log/cron.error.log', :standard => 'log/cron.log'}
job_type :rake, 'cd :path && /usr/local/bin/govuk_setenv govuk_need_api bundle exec rake :task :output'
job_type :run_script, 'cd :path && RAILS_ENV=:environment /usr/local/bin/govuk_setenv govuk_need_api script/:task :output'

every 1.day, :at => '4:00am' do
  rake "organisations:import"
end