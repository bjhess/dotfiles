ENV["WATCHR"] = "1"
system 'clear'

def growl(result, options={})
  growlnotify = `which growlnotify`.chomp
  title = "Watchr Test Results"

  split_result = result.split(/\n/)
  message = split_result.reverse.find{|r| r.match(/errors|failures/)}
  # message = "#{split_result[-2]} #{split_result[-1]}" rescue nil
  message = "#{options[:prepend]} #{message}" if options[:prepend]
  message = "#{message} #{options[:append]}" if options[:append]

  image = (message.include?('0 failures, 0 errors') || message.match(/examples?,\s0\s(errors|failures)/)) ? 
            "~/.watchr_images/passed.png" : 
            "~/.watchr_images/failed.png"
  options = "-w -n Watchr --image '#{File.expand_path(image)}' -m '#{message}' '#{title}'"
  system %(#{growlnotify} #{options} &)
end

def run(cmd)
  puts(cmd)
  `#{cmd}`
end

def run_test_file(file)
  if file =~ /spec.rb$/
    run_spec_file(file) 
    return
  end

  system('clear')
  result = if `ps ax|grep -i /spork|grep -iv grep|wc -l`.to_i > 0
    run %Q(bundle exec testdrb #{file})
  else
    run %Q(bundle exec testrb -I lib:app:test #{file})
  end

  growl(result, :append => "in file: #{file}")
  puts result
end

def run_spec_file(file)
  system('clear')
  result = run(%Q(ruby -I"lib:spec" -rubygems #{file}))
  growl result
  puts result
end

def run_all_tests
  system('clear')
  result = run "rake test"
  growl result
  puts result
end

def run_all_specs
  system('clear')
  result = run "rake spec"
  growl result
  puts result
end

def run_all_features
  system('clear')
  run "cucumber"
end

def related_test_files(path)
  test_or_spec = Dir['test'].size == 1 ? 'test' : 'spec'
  Dir["#{test_or_spec}/**/*.rb"].select { |file| file =~ /#{File.basename(path).split(".").first}_#{test_or_spec}.rb/ }
end

def run_suite
  run_all_tests
  run_all_specs
  run_all_features
end

watch('test/test_helper\.rb') { run_all_tests }
watch('test/.*/.*_test\.rb') { |m| run_test_file(m[0]) }
watch('spec/spec_helper\.rb') { run_all_specs }
watch('spec/.*/.*_spec\.rb') { |m| run_test_file(m[0]) }
watch('app/.*/.*\.rb') { |m| related_test_files(m[0]).map {|tf| run_test_file(tf) } }
watch('features/.*/.*\.feature') { run_all_features }

# --------------------------------------------------
# Signal Handling
# --------------------------------------------------
# Ctrl-\
Signal.trap('QUIT') do
  puts " --- Running all tests ---\n\n"
  run_all_tests
end

# Ctrl-C
Signal.trap('INT') { abort("\n") }