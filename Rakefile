require 'rake'
 
desc "install the dot files into user's home directory"
task :install do
  install_files("*", %w[Rakefile README README.markdown ssh])
  install_files("ssh/*")
end
 
def replace_file(file)
  system %Q{rm "$HOME/.#{file}"}
  link_file(file)
end
 
def link_file(file)
  puts "linking ~/.#{file}"
  system %Q{ln -s "$PWD/#{file}" "$HOME/.#{file}"}
end

def install_files(glob, exclusion_list=[])
  replace_all = false
  Dir[glob].each do |file|
    next if exclusion_list.include?(file)
    
    if File.exist?(File.join(ENV['HOME'], ".#{file}"))
      if replace_all
        replace_file(file)
      else
        print "overwrite ~/.#{file}? [ynaq] "
        case $stdin.gets.chomp
        when 'a'
          replace_all = true
          replace_file(file)
        when 'y'
          replace_file(file)
        when 'q'
          exit
        else
          puts "skipping ~/.#{file}"
        end
      end
    else
      link_file(file)
    end
  end
end
