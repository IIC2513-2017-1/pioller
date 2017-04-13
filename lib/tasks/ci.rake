# frozen_string_literal: true

if ENV['RAILS_ENV'] == 'development' || ENV['RAILS_ENV'] == 'test'
  require 'rubocop/rake_task'
  require 'reek/rake/task'

  task 'brakeman' do
    sh 'brakeman -z -q'
  end
  RuboCop::RakeTask.new
  Reek::Rake::Task.new do |t|
    t.config_file   = '.reek'
    t.source_files  = FileList['./**/*.rb'].exclude('./vendor/**/*.rb')
  end
  task 'flay' do
    sh 'flay .'
  end
  task 'rbp' do
    sh 'rails_best_practices . -f html'
  end
  task linters: %i[reek rubocop rbp brakeman flay]
end
