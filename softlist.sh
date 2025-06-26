
#http://brew.sh/
#http://ohmyz.sh/

#安装xcode
#安装brew  
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install wget
brew install git
brew install tig
brew install git-flow
brew install git-extras
# brew install svn
brew install autojump
brew install htop
brew install tmux
brew install telnet
brew install zsh

sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

brew install rbenv
brew install rbenv-gemset
rbenv install 3.0.0

brew install rustup
brew install go

brew install maven
brew install tomcat

#多机ssh查看并执行
brew install csshX

brew install vim
brew install helix
brew install zed
brew install bat

#vim plugin
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

#ssh proxy soft
brew  install corkscrew

#install virtualbox
brew install boot2docker
#日志查看
brew install lnav


#Homebrew Cask extends Homebrew 可视化程序安装
brew tap caskroom/cask
brew install caskroom/cask/brew-cask

brew install workflowy

#brew cask install squirrel
#安装ntfs文件读取软件
brew cask install mounty
#安装按键显示软件
brew cask install keycastr
#view code
brew cask install google-chrome
brew cask install evernote
brew cask install dropbox
brew cask install visual-studio-code
brew cask install sourcetree
brew cask install java
brew cask install iterm2
#docker and manage gui
brew cask install docker
brew cask install Kitematic
brew install container

#虚拟机
brew cask install virtualbox

#切换python
brew install pyenv
# pyenv install 2.7
pyenv install 3.12.0
pyenv rehash
brew install pyenv-virtualenv
brew install uv

#切换ruby
# curl -sSL https://get.rvm.io | bash
# brew install rbenv

#安装gnu工具替代mac的BSD工具
# GNU Coreutils
brew install coreutils
#添加dupes这个源
brew tap homebrew/dupes
brew install grep --with-default-names
brew install gnu-indent --with-default-names
brew install gnu-sed --with-default-names
brew install gnu-tar --with-default-names
brew install findutils --with-default-names
brew install gnu-which --default-names
brew install gawk
brew install gnutls

brew install gzip
brew install rsync
brew install less

brew install proxychains-ng

#facebook os query(sql)
brew update
brew install osquery
/usr/local/bin/osqueryi

#ag file search
brew install the_silver_searcher

#react native develope
brew install node
brew install watchman #用于监控bug和文件变化，并且可以触发指定的操作。
npm install -g react-native-cli
