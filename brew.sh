#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Ask for the administrator password upfront.
sudo -v

# Keep-alive: update existing `sudo` time stamp until the script has finished.
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# system tools [[[1
# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed
brew install zsh
chsh -s /usr/local/bin/zsh

# Install `wget` with IRI support.
brew install wget

# Install RingoJS and Narwhal.
# Note that the order in which these are installed is important;
# see http://git.io/brew-narwhal-ringo.
brew install ringojs
brew install narwhal

# Install Python
brew install python
brew install python3

# Install ruby-build and rbenv
brew install ruby-build
brew install rbenv
LINE='eval "$(rbenv init -)"'
grep -q "$LINE" ~/.extra || echo "$LINE" >> ~/.extra
# 1]]]

# Install more recent versions of some OS X tools. [[[1
brew install vim
# 1]]]

# Install font tools. [[[1
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2
brew tap homebrew/cask-fonts
brew cask install font-meslo-nerd-font
brew cask install font-iosevka-nerd-font-mono
# 1]]]

# Install some CTF tools; see https://github.com/ctfs/write-ups. [[[1
brew install aircrack-ng
brew install apktool
brew install bfg
brew install binutils
brew install binwalk
brew install cifer
brew install dex2jar
brew install dns2tcp
brew install fcrackzip
brew install foremost
brew install hashpump
brew install hydra
brew install john
brew install knock
brew install netpbm
brew install nmap
brew install pngcheck
brew install socat
brew install sqlmap
brew install tcpflow
brew install tcpreplay
brew install tcptrace
brew install ucspi-tcp # `tcpserver` etc.
brew install homebrew/x11/xpdf
brew install xz
# 1]]]

# Install other useful binaries. [[[1
brew install ack
brew install dark-mode
brew install ffmpeg
#brew install exiv2
brew install git
brew install git-lfs
brew install git-flow
brew install git-extras
brew install hub
brew install imagemagick
brew install jq
brew install lua
brew install lynx
brew install mas
brew install ngrep
brew install tcpdump
brew install p7zip
brew install pigz
brew install plantuml
brew install pv
brew install rename
brew install rhino
brew install speedtest_cli
brew install ssh-copy-id
brew install sshfs
brew install the_silver_searcher
brew install tmux
brew install tree
brew install webkit2png
brew install zopfli
brew install pkg-config libffi
brew install pandoc

# Lxml and Libxslt
brew install libxml2
brew install libxslt
brew link libxml2 --force
brew link libxslt --force
# 1]]]

# casks [[[1
# 效率工具
brew cask install --appdir="/Applications" 1password
brew cask install --appdir="/Applications" 1password-cli
brew cask install --appdir="/Applications" alfred
brew cask install --appdir="/Applications" dropbox
brew cask install --appdir="/Applications" hammerspoon

# 文档&办公
brew cask install --appdir="/Applications" evernote
brew cask install --appdir="/Applications" microsoft-office
brew cask install --appdir="/Applications" sketch
brew cask install --appdir="/Applications" skitch
brew cask install --appdir="/Applications" tunnelblick

# 开发工具
brew cask install --appdir="/Applications" charles
brew cask install --appdir="/Applications" dash
brew cask install --appdir="/Applications" goland
brew cask install --appdir="/Applications" iterm2
brew cask install --appdir="~/Applications" java
brew cask install --appdir="/Applications" pycharm
brew cask install --appdir="/Applications" setapp
brew cask install --appdir="/Applications" sublime-text
brew cask install --appdir="/Applications" visual-studio-code
brew cask install --appdir="/Applications" studio-3t
brew tap railwaycat/emacsmacport
brew cask install --appdir="/Applications" emacs-mac

# 浏览器 & IM
brew cask install --appdir="/Applications" dingtalk
brew cask install --appdir="/Applications" firefox
brew cask install --appdir="/Applications" microsoft-edge
brew cask install --appdir="/Applications" google-chrome
brew cask install --appdir="/Applications" telegram
mas install 836500024 # wechat
mas install 1189898970 # wechat work

# 工具
brew cask install --appdir="/Applications" clashx
brew cask install --appdir="/Applications" iina
brew cask install --appdir="/Applications" osxfuse
brew cask install --appdir="/Applications" vmware-fusion
brew cask install --appdir="/Applications" anki
brew cask install --appdir="/Applications" karabiner-elements
brew cask install --appdir="/Applications" baiduinput
brew cask install --appdir="/Applications" ghidra
brew cask install --appdir="/Applications" setapp
brew cask install --appdir="/Applications" little-snitch
brew cask install --appdir="/Applications" devonthink

#Remove comment to install LaTeX distribution MacTeX
brew cask install --appdir="/Applications" mactex
# 1]]]

# Core Dev tools [[[1
# Install Docker, which requires virtualbox
brew install docker

brew install thrift
brew install protobuf

brew install twpayne/taps/chezmoi

# golang [[[2
brew install golang
mkdir -p $HOME/go/{src,pkg,bin}

# Install go tools.
go get -u -v github.com/ramya-rao-a/go-outline
go get -u -v github.com/acroca/go-symbols
go get -u -v github.com/nsf/gocode
go get -u -v github.com/rogpeppe/godef
go get -u -v golang.org/x/tools/cmd/godoc
go get -u -v github.com/zmb3/gogetdoc
go get -u -v github.com/golang/lint/golint
go get -u -v github.com/fatih/gomodifytags
go get -u -v github.com/uudashr/gopkgs/cmd/gopkgs
go get -u -v golang.org/x/tools/cmd/gorename
go get -u -v sourcegraph.com/sqs/goreturns
go get -u -v golang.org/x/tools/cmd/goimports
go get -u -v github.com/cweill/gotests/...
go get -u -v golang.org/x/tools/cmd/guru
go get -u -v github.com/josharian/impl
go get -u -v github.com/haya14busa/goplay/cmd/goplay
go get -u -v github.com/uudashr/gopkgs/cmd/gopkgs
go get -u -v github.com/davidrjenni/reftools/cmd/fillstruct
# 2]]]
# 1]]]

# Install developer friendly quick look plugins; see https://github.com/sindresorhus/quick-look-plugins
brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzip qlimagesize webpquicklook suspicious-package quicklookase qlvideo

# Remove outdated versions from the cellar.
brew cleanup

# vim:fdm=marker:fmr=[[[,]]]
