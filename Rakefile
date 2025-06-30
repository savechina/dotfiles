require 'rake'

desc 'backup dot files'
task :dot do
  file = '~/.m2/setting.xml'

  files = FileList['.zshrc',
                   '.zshenv',
                   '.zprofile',
                   '.profile',
                   '.gitconfig',
                   '.vimrc',
                   '.ssh',
                   '.m2/setting.xml']

  puts files

  files.each do |f|
    # user root dir
    from_file = File.expand_path(f, '~')

    to_file = "./#{f}"

    to_dir = File.dirname(to_file)

    puts to_file

    puts to_dir

    puts File.exist?(to_dir)

    Dir.mkdir(to_dir) unless File.exist?(to_dir)

    next unless File.exist?(from_file)

    puts from_file

    sh "cp -fr #{from_file}  #{to_dir}"
  end
end

namespace :vim do
  desc 'backup vimrc file to dotfiles'
  task :backup do
     puts "vimrc backup"
     home=Dir.home
     puts home

     file=".vimrc"
     sh "cp #{home}/#{file} ./"
  end

  desc 'restore  vimrc file to $HOME'
  task :restore do
    puts "vimrc resotre to $HOME:#{Dir.home}"
     
    home=Dir.home
    puts home

    file=".vimrc"
    sh "cp ./#{file} #{home}/"
  end
 end
