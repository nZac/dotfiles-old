export DOTFILES=$HOME/dotfiles

source $DOTFILES/antigen/antigen.zsh

# Apply my custom things
export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin

source $HOME/dotfiles/antigen/antigen.zsh

# Setup some environment variables
export WORKON_HOME=$HOME/.virtualenvs

export PROJECT_HOME=$HOME/j

# Load oh-my-zsh library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git

# as a python develop, pip assistance is nice
antigen bundle pip

# I use this in the them I use
antigen bundle tonyseek/oh-my-zsh-virtualenv-prompt

# For my work mac
antigen bundle brew

# When I use sublime I like to launch it from the command line
antigen bundle sublime

# I use vagrant at work and at home
antigen bundle vagrant

# gives virtualenv support
antigen bundle virtualenvwrapper

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme https://gist.github.com/7885406.git personal

# Tell antigen that you're done.
antigen apply

if which pyenv > /dev/null; then
    eval "$(pyenv init -)";
    pyenv virtualenvwrapper
    export PYENV_VIRTUALENVWRAPPER_PREFER_PYVENV="true"
fi

export EDITOR=$(which vim)

# Setup gopath
export GOPATH=$HOME/j/oss/gocode

export PATH=$PATH:$GOPATH/bin
export SKOSHAPP=/Users/zaccardi/j/skosh

export SITES_ROOT=$HOME/j/ndus/cf-apps

# Setup some helpful aliases
alias gs="git status"
alias lla="ls -la"
alias ssh="TERM=xterm ssh"


export SSH_AUTH_SOCK=~/.ssh/ssh_agent

ssh-add -l >/dev/null 2>&1
if [ $? = 2 ]; then
   # No ssh-agent running
   rm -rf $SSH_AUTH_SOCK
   # >| allows output redirection to over-write files if no clobber is set
   ssh-agent -a $SSH_AUTH_SOCK >| /tmp/.ssh-script
   source /tmp/.ssh-script
   echo $SSH_AGENT_PID >| ~/.ssh-agent-pid
   rm /tmp/.ssh-script
   echo "NEW SSH AGENT" $SSH_AGENT_PID
else
    echo "REUSING SSH AGENT" $SSH_AGENT_PID
fi
