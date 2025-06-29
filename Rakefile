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
