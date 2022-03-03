# Loadingtimes
# zmodload zsh/zprof # top of your .zshrc file

autoload -Uz compinit
  for dump in ~/.zcompdump(N.mh+24); do
    compinit
  done
compinit -C

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
SPACESHIP_CHAR_SYMBOL="$(seasonal_chevrons) "
SPACESHIP_TIME_SHOW=true
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
# End Config
# End Spaceship Config

# Begin Exports
export LC_ALL=de_DE.UTF-8
export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:/usr/local/opt/apr/bin:$PATH
export PATH=/usr/local/opt/python@3.9/libexec/bin:$PATH
export EDITOR='vi'
export ZSH="/Users/pr0gstar/.oh-my-zsh"
export HISTSIZE=1000
export SAVEHIST=1000
export JAVA_HOME='/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home'
# End Exports

# Begin Plugins
plugins=(
#  vscode
  git
  gitfast
#  bundler
#  dotenv
#  osx
   macos
#  rake
#  rbenv
#  ruby
  zsh-syntax-highlighting
  zsh-autosuggestions
)
# End Plugins

# ----------------------
# Git Aliases
# ----------------------

alias gcm='git commit --message'
alias gl='git pull'

# End Git-Alias

# Begin NVM
export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completionexport NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
export NVM_SYMLINK_CURRENT=true
# End NVM

# Begin Alias
alias startup='./clearcache.sh && yarn run encore dev && php bin/console server:run'
alias yred='yarn run encore dev'
alias yrep='yarn run encore production'
alias ll='exa -l'
alias ls='exa'
alias gclear='git fetch -p && for branch in `git branch -vv | grep ": gone]" | awk "{print $1}"`; do git branch -D $branch; done'
alias comic_dl="docker run -it --rm -v $(pwd):/comics -w /comics comic-dl:py3.8.5-buster comic_dl --verbose -dd /comics"
alias brew='env PATH=${PATH//$(pyenv root)/shims:/} brew'
# End Alias

# Begin PHPBrew
[[ -e ~/.phpbrew/bashrc ]] && source ~/.phpbrew/bashrc
# End PHPBrew

# Begin pyenv
if command -v pyenv 1>/dev/null 2>&1; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init --path)"
  eval "$(pyenv init -)"
fi
# End pyenv

# Begin Source
source $ZSH/oh-my-zsh.sh
# End Source

# Loadingtimes
# zprof # bottom of .zshrc
