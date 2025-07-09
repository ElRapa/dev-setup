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
  -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install GNU core utilities (those that come with OS X are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils
#sudo ln -s /usr/local/bin/gsha256sum /usr/local/bin/sha256sum

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed
# Install Bash 4.
brew install bash
brew install bash-completion2
# We installed the new shell, now we have to activate it
echo "Adding the newly installed shell to the list of allowed shells"
# Prompts for password
sudo bash -c 'echo /usr/local/bin/bash >> /etc/shells'
# Change to the new shell, prompts for password
#chsh -s /usr/local/bin/bash

# Install latest zsh
brew install zsh
# Change to zsh-shell
chsh -s $(which zsh)
# Test correct usage of zsh
echo $0
which zsh
echo "must match: /usr/local/bin/zsh"

# Install `wget` with IRI support.
# GNU Wget is a free software package for retrieving files using HTTP, HTTPS, FTP and FTPS, the most widely used Internet protocols. It is a non-interactive commandline tool, so it may easily be called from scripts, cron jobs, terminals without X-Windows support, etc.
# https://www.gnu.org/software/wget/
brew install wget --with-iri

# Install RingoJS and Narwhal.
# Note that the order in which these are installed is important;
# see http://git.io/brew-narwhal-ringo.
#brew install ringojs
#brew install narwhal

# Install ruby-build and rbenv
#brew install ruby-build
#brew install rbenv
#LINE='eval "$(rbenv init -)"'
#grep -q "$LINE" ~/.extra || echo "$LINE" >> ~/.extra

# Install more recent versions of some OS X tools.
brew install vim --override-system-vi
brew install homebrew/dupes/grep
brew install homebrew/dupes/openssh
brew install homebrew/dupes/screen
brew install homebrew/php/php55 --with-gmp

# Install font tools.
brew tap bramstein/webfonttools
brew install sfnt2woff
brew install sfnt2woff-zopfli
brew install woff2

# Install some CTF tools; see https://github.com/ctfs/write-ups.
#brew install aircrack-ng
#brew install bfg
#brew install binutils
#brew install binwalk
#brew install cifer
#brew install dex2jar
#brew install dns2tcp
#brew install fcrackzip
#brew install foremost
#brew install hashpump
#brew install hydra #This tool is a proof of concept code, to give researchers and security consultants the possibility to show how easy it would be to gain unauthorized access from remote to a system
#brew install john #Featureful UNIX password cracker
#brew install knock
#brew install netpbm
#brew install nmap
#brew install pngcheck
#brew install socat
#brew install sqlmap
#brew install tcpflow
#brew install tcpreplay
#brew install tcptrace
#brew install ucspi-tcp # `tcpserver` etc.

# Install other useful binaries.
brew install ack
brew install dark-mode
#brew install exiv2
brew install git
brew install git-lfs
brew install git-flow
brew install git-extras
#brew install hub #Add GitHub support to git on the command-line
#brew install imagemagick --with-webp
#brew install lua
#brew install lynx
#brew install p7zip
#brew install pigz
#brew install pv
#brew install rename
#brew install rhino
brew install speedtest_cli
#brew install ssh-copy-id
brew install tree #Display directories as trees (with optional color/HTML output)
#brew install webkit2png #WebKitGTK is a full-featured port of the WebKit rendering engine, suitable for projects requiring any kind of web integration, from hybrid HTML/CSS applications to full-fledged web browsers.
#brew install zopfli
brew install pandoc #Swiss-army knife of markup format conversion
brew install zlib

brew install sqlite3
brew install openssl
brew install homebrew/x11/xpdf
brew install xz

# Lxml and Libxslt
#brew install libxml2
#brew install libxslt
#brew link libxml2 --force
#brew link libxslt --force

# Install Heroku
#brew install heroku/brew/heroku
#heroku update

# Core casks
#brew install --cask alfred
brew install --cask iterm2
#brew install --cask java
#brew install --cask xquartz

# Development tool casks
brew install --cask sublime-text
#brew install --cask atom
brew install --cask virtualbox
brew install --cask vagrant
#brew install --cask macdown
brew install --cask visual-studio-code

# Misc casks
brew install --cask google-chrome
brew install --cask firefox
brew install --cask slack
#brew install --cask dropbox
#brew install --cask evernote
#brew install --cask 1password
brew install --cask gimp
#brew install --cask inkscape
brew install --cask obsidian
brew install --cask onedrive
brew install --cask calibre

#Remove comment to install LaTeX distribution MacTeX
#brew install --cask" mactex

# Install Docker, which requires virtualbox
brew install docker

# Install developer friendly quick look plugins; see https://github.com/sindresorhus/quick-look-plugins
#brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzip qlimagesize webpquicklook suspicious-package quicklookase qlvideo

# Remove outdated versions from the cellar.
brew cleanup
