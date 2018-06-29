if Rails.env.test?
  namespace :ci do
    desc 'For ci (clear Unnecessary files, rubocop, rspec)'
    task build: %i[clear rubocop rspec]

    desc 'Clear unnecessary files for CI (CarrierwaveCache, log, tmp)'
    task clear: %i[carrierwave:clean log:clear tmp:clear] do
      # FileUtils.remove_entry_secure('./public/uploads/student', true)
    end

    desc 'Rubocop for CI (Rubocop::Formatter::CheckstyleFormatter => tmp/checkstyle.xml)'
    task :rubocop do
      sh 'bundle exec rubocop -c .rubocop.yml' \
         ' --require rubocop/formatter/checkstyle_formatter' \
         ' --format progress' \
         ' --format RuboCop::Formatter::CheckstyleFormatter' \
         ' --out tmp/checkstyle.xml' \
         ' --fail-level E'
    end

    desc 'RSpec for CI (RspecJunitFormatter report => tmp/rspec.xml)'
    task rspec: %i[setup_db] do
      sh 'RAILS_ENV=test COVERAGE=y bundle exec rspec --format progress' \
         ' --format RspecJunitFormatter --out tmp/rspec.xml'
    end

    desc 'Setup DB (drop create migrate)'
    task :setup_db do
      Rake::Task['db:environment:set'].invoke
      Rake::Task['db:drop'].invoke
      Rake::Task['db:create'].invoke
      Rake::Task['db:migrate'].invoke
    end
  end
end
