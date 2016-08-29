# dotfiles

The files to make the computer use enjoi

## Non-File Setups

### OSX Tweaks

Keyrepeat isn't great by default
 
```
defaults write -g ApplePressAndHoldEnabled -bool false
defaults write -g InitialKeyRepeat -int 10 # normal minimum is 15 (225 ms)
defaults write -g KeyRepeat -int 1 # normal minimum is 2 (30 ms)
```
