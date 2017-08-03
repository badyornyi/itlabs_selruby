namespace :tests do

  # registration tests

  desc 'Registration test'
  task :register_tests do
    sh 'cucumber -t @register'
  end


  # create more tasks where each should have register task as dependency

  desc 'Log in tests'
  task :log_in_tests => :register_tests do
    sh 'cucumber -t @log_in'
  end

  desc 'Log out tests'
  task :log_out_tests => :register_tests do
    sh 'cucumber -t @log_out'
  end

  desc 'Project only tests'
  task :project_tests => :register_tests do
    sh 'cucumber -t @project -t ~@member -t ~@version'
  end

  desc 'This task runs all tasks above'
  task :more_tasks => [:log_in_tests, :log_out_tests, :project_tests]


  # make big task to run all tests excluding register with registration task as a dependency

  desc 'All tests running excluding registration'
  task :all_tests_no_reg => :register_tests do
    sh 'cucumber -t @page_objected -t ~@register'
  end

end