# Loadingtimes
# zmodload zsh/zprof # top of your .zshrc file

# autoload -Uz compinit
#   for dump in ~/.zcompdump(N.mh+24); do
#     compinit
#   done
# compinit -C

seasonal_chevrons () {
  local date=$(date)
  local chevrons="❯❯❯"

  case $date in
    # spring
    *Mar*|*Apr*|*May*)
      chevrons="%F{cyan}❯%F{green}❯%F{yellow}❯%f"
      ;;
    # summer
    *Jun*|*Jul*|*Aug*)
      chevrons="%F{green}❯%F{yellow}❯%F{red}❯%f"
      ;;
    # fall
    *Sep*|*Oct*|*Nov*)
      chevrons="%F{yellow}❯%F{red}❯%F{magenta}❯%f"
      ;;
    # winter
    *Dec*|*Jan*|*Feb*)
      chevrons="%F{magenta}❯%F{cyan}❯%F{green}❯%f"
      ;;
    *)
      ;;
  esac

  echo -en $chevrons
}

# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
prompt spaceship

# Begin Spaceship Config
SPACESHIP_TIME_SHOW=true
SPACESHIP_CHAR_SYMBOL="$(seasonal_chevrons) "
SPACESHIP_PROMPT_ORDER=(
  user              # Username section
  host              # Hostname section
  dir               # Current directory section
  git               # Git section (git_branch + git_status)
  hg                # Mercurial section (hg_branch  + hg_status)
  package           # Package version
  node              # Node.js section
  ruby              # Ruby section
  elixir            # Elixir section
  xcode             # Xcode section
  swift             # Swift section
  golang            # Go section
  php               # PHP section
  rust              # Rust section
  haskell           # Haskell Stack section
  julia             # Julia section
  docker            # Docker section
  aws               # Amazon Web Services section
  venv              # virtualenv section
  conda             # conda virtualenv section
  pyenv             # Pyenv section
  dotnet            # .NET section
  ember             # Ember.js section
  kubectl           # Kubectl context section
  exec_time         # Execution time
  time              # Time stampts section
  line_sep          # Line break
  battery           # Battery level and status
  vi_mode           # Vi-mode indicator
  jobs              # Backgound jobs indicator
  exit_code         # Exit code section
  char              # Prompt character
)
# End Spaceship Config

# Begin Exports
# export LC_ALL=de_DE.UTF-8
export LC_ALL=en_US.UTF-8
export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:/usr/local/opt/apr/bin:$PATH
export PATH=.nvm/current/bin:$PATH
export EDITOR='vi'
export ZSH="$HOME/.oh-my-zsh"
export HISTSIZE=1000
export SAVEHIST=1000
export JAVA_HOME=/Library/Java/JavaVirtualMachines/temurin-18.jdk/Contents/Home
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$ANDROID_HOME/platform-tools:$PATH
export PATH=$ANDROID_HOME/tools:$PATH
# End Exports

# Begin zsh Plugins
plugins=(
#  vscode
  git
  gitfast
  python
#  bundler
#  dotenv
   macos
#  rake
#  rbenv
#  ruby
  zsh-syntax-highlighting
  zsh-autosuggestions
  terraform
  yarn-autocompletions
)
# End zsh Plugins

# Begin Homebrew
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi
# End Homebrew

# Begin NVM
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh
if [ -f "$NVM_DIR/bash_completion" ]; then
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion" # This loads nvm bash_completion
fi

export NVM_SYMLINK_CURRENT=true

[ -x "$(command -v npm)" ] && export NODE_PATH=$NODE_PATH:`npm root -g`

# Function for LTS Update
function nvm-upgrade {
  local prev_ver=$(nvm current)
  nvm install --lts --latest-npm
  if [ "$prev_ver" != "$(nvm current)" ]
  then
    nvm reinstall-packages $prev_ver
    nvm uninstall $prev_ver
  fi
  nvm cache clear
}
# End NVM

# Begin Source
source $ZSH/oh-my-zsh.sh
# End Source

# Begin Alias
alias gcm='git commit --message'
alias gl='git pull'
alias ll='exa -l -a'
alias ls='exa'
alias gclear='git fetch -p && for branch in `git branch -vv | grep ": gone]" | awk "{print $1}"`; do git branch -D $branch; done'
alias mod_teams='sudo sh $HOME/teams_mod.sh'
alias brew-upgrade="brew update && brew upgrade && brew upgrade --cask && brew cleanup && brew doctor"

alias teams='sudo codesign --remove-signature "/Applications/Microsoft Teams.app" &&
sudo codesign --remove-signature "/Applications/Microsoft Teams.app/Contents/Frameworks/Microsoft Teams Helper.app" &&
sudo codesign --remove-signature "/Applications/Microsoft Teams.app/Contents/Frameworks/Microsoft Teams Helper (GPU).app" &&
sudo codesign --remove-signature "/Applications/Microsoft Teams.app/Contents/Frameworks/Microsoft Teams Helper (Plugin).app" &&
sudo codesign --remove-signature "/Applications/Microsoft Teams.app/Contents/Frameworks/Microsoft Teams Helper (Renderer).app"'
# End Alias

# Loadingtimes
# zprof # bottom of .zshrc
### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/pr0gstar/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)