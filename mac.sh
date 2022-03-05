#!/usr/bin/env bash

set -e

__dock_item() {
    printf '%s%s%s%s%s' \
           '<dict><key>tile-data</key><dict><key>file-data</key><dict>' \
           '<key>_CFURLString</key><string>' \
           "$1" \
           '</string><key>_CFURLStringType</key><integer>0</integer>' \
           '</dict></dict></dict>'
}

printf '%s' 'Setting up Mac settings ...'
defaults write com.apple.dock \
               persistent-apps -array "$(__dock_item /Applications/Firefox.app)" \
                                      "$(__dock_item /System/Applications/Contacts.app)" \
                                      "$(__dock_item /System/Applications/Calendar.app)" \
                                      "$(__dock_item /System/Applications/Notes.app)" \
                                      "$(__dock_item /System/Applications/Mail.app)" \
                                      "$(__dock_item /System/Applications/Utilities/Terminal.app)" \
                                      "$(__dock_item /Applications/BBEdit.app)" \
                                      "$(__dock_item /Applications/Visual\ Studio\ Code.app)" \
                                      "$(__dock_item /Applications/Spotify.app)" \
                                      "$(__dock_item /Applications/Slack.app)" \
                                      "$(__dock_item /System/Applications/Messages.app)"

defaults write com.apple.dock magnification -bool true
defaults write com.apple.dock tilesize -int 50
defaults write com.apple.dock largesize -int 78
defaults write com.apple.dock mineffect -string "scale"
defaults write com.apple.dock minimize-to-application -bool true
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock show-recents -bool false
defaults write com.apple.dock autohide-time-modifier -float 0.5
defaults write com.apple.dock autohide-delay -float 0
defaults write com.apple.dock show-process-indicators -bool true

killall Dock

defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults write com.apple.finder AppleShowAllFiles -bool true
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
defaults write com.apple.finder ShowStatusBar -bool true
defaults write com.apple.finder ShowPathbar -bool false
defaults write com.apple.finder FXPreferredViewStyle -string "clmv"
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool false
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool false
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
defaults write com.apple.finder CreateDesktop -bool false

killall Finder

defaults write com.apple.menuextra.clock ShowSeconds -bool true
defaults write com.apple.menuextra.clock DateFormat -string "EEE d MMM HH:mm:ss"

killall SystemUIServer

defaults write NSGlobalDomain KeyRepeat -int 2
defaults write NSGlobalDomain InitialKeyRepeat -int 25
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

printf '%s\n' ' done.'
