#!/usr/bin/env bash

echo "Creating an SSH key for you..."
ssh-keygen -t ed25519

echo "Please add this public key to Github \n"
echo "https://github.com/account/ssh \n"
read -p "Press [Enter] key after this..."

echo "Installing xcode-stuff"
xcode-select --install

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew recipes
echo "Updating homebrew..."
brew update

echo "Installing Git..."
brew install git

echo "Git config"

git config --global user.name "T. Debo"
git config --global user.email tim@rawcreativestudios.com

echo "Installing brew git utilities..."
brew install git-extras
brew install git-flow

echo "Installing other brew stuff..."
brew install pkg-config
brew install python
brew install python3
brew install php
brew install wget
brew install composer
brew install mysql
brew install tree
brew install redis
brew install trash
brew install mackup
brew install node
brew install n
brew install watchman
brew install sqlite
brew install s3cmd
brew install youtube-dl
brew install ffmpeg
brew install imagemagick
brew install ssh-copy-id
brew install the_silver_searcher
brew install httpie
brew install broot
brew install z

#@TODO install our custom fonts and stuff

echo "Cleaning up brew"
brew cleanup

echo "Copying dotfiles from Github"
cd ~
git clone git@github.com:rawcreative/dotfiles.git .dotfiles
cd .dotfiles
sh install.sh

#Install Zsh & Oh My Zsh
echo "Installing Oh My ZSH..."
curl -L http://install.ohmyz.sh | sh

echo "Setting up Oh My Zsh theme..."
cd  /Users/tim/.oh-my-zsh/themes
curl https://gist.githubusercontent.com/rawcreative/73724ad6e3058c2a66eeeec906399dca/raw/1411cfade4aea48f12bafdf250fa26b0ead2b459/rawcreative.zsh-theme > rawcreative.zsh-theme

echo "Setting up Zsh plugins..."
cd ~/.oh-my-zsh/custom/plugins
git clone git://github.com/zsh-users/zsh-syntax-highlighting.git

echo "Setting ZSH as shell..."
chsh -s /bin/zsh


# Install Valet
composer global require laravel/valet
~/.composer/vendor/bin/valet install

# Apps
apps=(
  adobe-creative-cloud
  alfred
  arq
  bettertouchtool
  blender
  clipy
  dash
  db-browser-for-sqlite
  dropbox
  firefox
  google-chrome
  handbrake
  imageoptim
  insomnia
  iterm2
  kap
  microsoft-office
  private-internet-access
  querious
  shuttle
  sourcetree
  spotify
  scroll-reverser
  slack
  sketch
  skyfonts
  sublime-text
  vlc
  transmission
  transmit
  zoomus
  1password
  sequel-pro
  qlmarkdown
  qlstephen
  qlcolorcode
  quicklook-json
  qlimagesize
  quicklook-csv
  suspicious-package
  visual-studio-code
)

# Install apps to /Applications
# Default is: /Users/$user/Applications
echo "Installing apps with Cask..."
brew cask install --appdir="/Applications" ${apps[@]}

brew cask alfred link

brew cask cleanup
brew cleanup

vscode=(
    Rubymaniac.vscode-paste-and-indent
    aaron-bond.better-comments
    alefragnani.project-manager
    bmewburn.vscode-intelephense-client
    christian-kohler.npm-intellisense
    christian-kohler.path-intellisense
    dariofuzinato.vue-peek
    daylerees.rainglow
    dbaeumer.vscode-eslint
    dkundel.vscode-new-file
    eg2.vscode-npm-script
    esbenp.prettier-vscode
    felixfbecker.php-intellisense
    formulahendry.auto-close-tag
    formulahendry.auto-rename-tag
    formulahendry.code-runner
    GrapeCity.gc-excelviewer
    hollowtree.vue-snippets
    HookyQR.beautify
    jasonnutter.search-node-modules
    junstyle.php-cs-fixer
    kokororin.vscode-phpfmt
    krisanalfa.tinkerHere
    marlosirapuan.vscode-theme-railscasts-plus
    mechatroner.rainbow-csv
    MehediDracula.php-namespace-resolver
    mikestead.dotenv
    mohsen1.prettify-json
    mrmlnc.vscode-attrs-sorter
    mrmlnc.vscode-duplicate
    mrmlnc.vscode-scss
    ms-python.python
    ms-vscode.sublime-keybindings
    mubaidr.vuejs-extension-pack
    naumovs.color-highlight
    neilbrayfield.php-docblocker
    neilding.language-liquid
    nikitaKunevich.snippet-creator
    octref.vetur
    oysun.vuehelper
    pflannery.vscode-versionlens
    rafa-acioly.laravel-helpers
    robertoachar.vscode-essentials-snippets
    ryannaddy.laravel-artisan
    sdras.vue-vscode-snippets
    seanwash.vue
    sleistner.vscode-fileutils
    TaoKlerks.poor-mans-t-sql-formatter-vscode
    tombonnike.vscode-status-bar-format-toggle
    tungvn.wordpress-snippet
    vincaslt.highlight-matching-tag
    vscode-icons-team.vscode-icons
    william-voyek.vscode-nginx
    wwm.better-align
    xabikos.JavaScriptSnippets
    yzhang.markdown-all-in-one
    Zignd.html-css-class-completion
)


echo "Installing VSCode extensions"
code --install-extension ${vscode[@]}

echo "Please setup and sync Dropbox, and then run this script again."
read -p "Press [Enter] key after this..."

echo "Restoring setup from Mackup..."
#mackup restore @TODO uncomment


echo "Setting some Mac settings..."

#"Disabling system-wide resume"
defaults write NSGlobalDomain NSQuitAlwaysKeepsWindows -bool false

#"Disabling automatic termination of inactive apps"
defaults write NSGlobalDomain NSDisableAutomaticTermination -bool true

#"Allow text selection in Quick Look"
defaults write com.apple.finder QLEnableTextSelection -bool TRUE

#"Disabling OS X Gate Keeper"
#"(You'll be able to install any app you want from here on, not just Mac App Store apps)"
sudo spctl --master-disable
sudo defaults write /var/db/SystemPolicy-prefs.plist enabled -string no
defaults write com.apple.LaunchServices LSQuarantine -bool false

#"Expanding the save panel by default"
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

#"Automatically quit printer app once the print jobs complete"
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

#"Saving to disk (not to iCloud) by default"
defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false

#"Check for software updates daily, not just once per week"
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

#"Disable smart quotes and smart dashes as they are annoying when typing code"
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

#"Enabling full keyboard access for all controls (e.g. enable Tab in modal dialogs)"
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

#"Disabling press-and-hold for keys in favor of a key repeat"
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

#"Setting trackpad & mouse speed to a reasonable number"
defaults write -g com.apple.trackpad.scaling 2
defaults write -g com.apple.mouse.scaling 2.5

#"Enabling subpixel font rendering on non-Apple LCDs"
defaults write NSGlobalDomain AppleFontSmoothing -int 2

#"Showing icons for hard drives, servers, and removable media on the desktop"
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true

#"Showing all filename extensions in Finder by default"
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

#"Disabling the warning when changing a file extension"
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

#"Use column view in all Finder windows by default"
defaults write com.apple.finder FXPreferredViewStyle Clmv

#"Avoiding the creation of .DS_Store files on network volumes"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

#"Enabling snap-to-grid for icons on the desktop and in other icon views"
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist

#"Setting the icon size of Dock items to 36 pixels for optimal size/screen-realestate"
defaults write com.apple.dock tilesize -int 36

#"Speeding up Mission Control animations and grouping windows by application"
defaults write com.apple.dock expose-animation-duration -float 0.1
defaults write com.apple.dock "expose-group-by-app" -bool true

#"Setting email addresses to copy as 'foo@example.com' instead of 'Foo Bar <foo@example.com>' in Mail.app"
defaults write com.apple.mail AddressesIncludeNameOnPasteboard -bool false

#"Enabling UTF-8 ONLY in Terminal.app and setting the Pro theme by default"
defaults write com.apple.terminal StringEncodings -array 4
defaults write com.apple.Terminal "Default Window Settings" -string "Pro"
defaults write com.apple.Terminal "Startup Window Settings" -string "Pro"

#"Preventing Time Machine from prompting to use new hard drives as backup volume"
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

#"Disable the sudden motion sensor as its not useful for SSDs"
sudo pmset -a sms 0

#"Speeding up wake from sleep to 24 hours from an hour"
# http://www.cultofmac.com/221392/quick-hack-speeds-up-retina-macbooks-wake-from-sleep-os-x-tips/
sudo pmset -a standbydelay 86400

#"Disable annoying backswipe in Chrome"
defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool false

#"Setting screenshots location to ~/Desktop/Screenshots"
defaults write com.apple.screencapture location -string "$HOME/Desktop/Screenshots"

#"Setting screenshot format to PNG"
defaults write com.apple.screencapture type -string "png"

#"Hiding Safari's bookmarks bar by default"
defaults write com.apple.Safari ShowFavoritesBar -bool false

#"Hiding Safari's sidebar in Top Sites"
defaults write com.apple.Safari ShowSidebarInTopSites -bool false

#"Disabling Safari's thumbnail cache for History and Top Sites"
defaults write com.apple.Safari DebugSnapshotsUpdatePolicy -int 2

#"Enabling Safari's debug menu"
defaults write com.apple.Safari IncludeInternalDebugMenu -bool true

#"Making Safari's search banners default to Contains instead of Starts With"
defaults write com.apple.Safari FindOnPageMatchesWordStartsOnly -bool false

#"Removing useless icons from Safari's bookmarks bar"
defaults write com.apple.Safari ProxiesInBookmarksBar "()"

#"Allow hitting the Backspace key to go to the previous page in history"
defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2BackspaceKeyNavigationEnabled -bool true

#"Enabling the Develop menu and the Web Inspector in Safari"
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari "com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled" -bool true

#"Adding a context menu item for showing the Web Inspector in web views"
defaults write NSGlobalDomain WebKitDeveloperExtras -bool true

#"Use `~/Downloads/Incomplete` to store incomplete downloads"
defaults write org.m0k.transmission UseIncompleteDownloadFolder -bool true
defaults write org.m0k.transmission IncompleteDownloadFolder -string "${HOME}/Downloads/Incomplete"

#"Don't prompt for confirmation before downloading"
defaults write org.m0k.transmission DownloadAsk -bool false

#"Trash original torrent files"
defaults write org.m0k.transmission DeleteOriginalTorrent -bool true

#"Hide the donate message"
defaults write org.m0k.transmission WarningDonate -bool false

#"Hide the legal disclaimer"
defaults write org.m0k.transmission WarningLegal -bool false

#"Disable 'natural' (Lion-style) scrolling"
#defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

# Don’t automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false



killall Finder


echo "Done!"

#@TODO install vagrant and sites folder