echo ''
echo '################### Installing Git Hooks ########################'
ln -f -s ~/.dotfiles/git/hooks/post-checkout .git/hooks/post-checkout
ln -f -s ~/.dotfiles/git/hooks/post-merge .git/hooks/post-merge

echo ''
echo '#################### Symlink Config Files #######################'
ln -f -s ~/.dotfiles/zsh/.zshrc ~/.zshrc
ln -f -s ~/.dotfiles/git/.gitconfig ~/.gitconfig
ln -f -s ~/.dotfiles/sublimetext/Preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Text/Packages/User/Preferences.sublime-settings
ln -f -s ~/.dotfiles/sublimetext/Mariana-pr0gstar.sublime-color-scheme ~/Library/Application\ Support/Sublime\ Text/Packages/User/Mariana-pr0gstar.sublime-color-scheme

echo ''
echo '########## Checkout Fonts from rpivate Github Repo! #############'
git checkout

echo ''
echo '################## Adding Fonts to System #######################'
cp ~/.dotfiles/fonts/DankMono/OpenType-PS/* ~/Library/Fonts/