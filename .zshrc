# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k" #"robbyrussell"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git 
  zsh-vi-mode 
  zsh-autosuggestions 
  #zsh-syntax-highlighting 
  F-Sy-H
  pip 
  history-substring-search 
)

if [[ $(hostname -s) == 'LappyTappy' ]]; then
	plugins=($plugins zsh-apple-touchbar)
fi

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
alias mv="mv -i"    # prompt before overwriting a file
alias cp="cp -i"    # prompt before overwriting a file
alias copy="tr -d '\n' | pbcopy"	# copy without the trailing newline (e.g. pwd | copy)
alias rsync='rsync --exclude=".DS_Store"'

set -o noclobber    # avoid overwriting files on output redirect

#DEFAULT_USER="jarod"

# vi edit mode
bindkey -v
export KEYTIMEOUT=1     # set lag time to 1ms
set -o vi

# activate the advanced move commands zmv and mmv
autoload -U zmv
alias mmv='noglob zmv -W'
alias zmv='noglob zmv'
alias zcp='noglob zmv -C'
alias zln='noglob zmv -L'
alias zsy='noglob zmv -Ls'


# FSL setup
if [[ -z $FSL_DIR && -e /usr/local/fsl ]]; then
    export FSLDIR=/usr/local/fsl
    source $FSLDIR/etc/fslconf/fsl.sh
    export PATH=$PATH:$FSLDIR/bin
fi

# Freesurfer setup
if [[ -z $FREESURFER_HOME ]]; then
	if [[ -d /Applications/freesurfer/7.4.0/ ]]; then  				# osx FreeSurfer 7.4.0 path
		export FREESURFER_HOME=/Applications/freesurfer/7.4.0/
	elif [[ -d /Applications/freesurfer/7.2.0/ ]]; then  			# osx FreeSurfer 7.2.0 path
		export FREESURFER_HOME=/Applications/freesurfer/7.2.0/
	elif [[ -d /Applications/freesurfer/7.1.1/ ]]; then    			# osx FreeSurfer 7.1.1 path
		export FREESURFER_HOME=/Applications/freesurfer/7.1.1/
	elif [[ -d /usr/local/freesurfer/7.4.1/ ]]; then				# linux Freesurfer 7.4.1 path
		export FREESURFER_HOME=/usr/local/freesurfer/7.4.1/
	elif [[ -d /usr/local/freesurfer/7.4.0/ ]]; then				# linux Freesurfer 7.4.0 path
		export FREESURFER_HOME=/usr/local/freesurfer/7.4.0/
	elif [[ -d /usr/local/freesurfer/7.3.2/ ]]; then				# linux Freesurfer 7.3.2 path
		export FREESURFER_HOME=/usr/local/freesurfer/7.3.2/
	elif [[ -f /usr/local/freesurfer/SetUpFreeSurfer.sh ]]; then	# linux path
		export FREESURFER_HOME=/usr/local/freesurfer/
	fi
	
	if [[ -n $FREESURFER_HOME ]]; then
		source $FREESURFER_HOME/SetUpFreeSurfer.sh $> /dev/null
	fi
fi

# setup OSX and Linux specific paths
if [ $(uname) = "Darwin" ]; then
	# add Matlab to path in OSX
	matlabPaths=(`ls -d /Applications/MATLAB_R*.app/bin`)			# in case there is more than one Matlab installation
	if [[ $#matlabPaths > 0 ]]; then
		export PATH=$PATH:$matlabPaths[-1]							# when sorted alphanumerically by default the last entry should be the most recent
	fi

	# add workbench to path in OSX
	[[ -d /Applications/workbench/bin_macosx64 ]] && export PATH=$PATH:/Applications/workbench/bin_macosx64

elif [ $(uname) = "Linux" ]; then
	# add cuda to path
	[[ -d /usr/local/cuda-12.3/bin ]] && export PATH=/usr/local/cuda-12.3/bin/${PATH:+:${PATH}}

	# add for pipx 
	[[ -d $HOME/.local/bin ]] && export PATH="$PATH:/home/jarod/.local/bin"

	# add workbench to path in linux
	[[ -d /opt/workbench/bin_linux64 ]] && export PATH=$PATH:/opt/workbench/bin_linux64

	# add ANTs bin to path
	if [ -d /opt/ants-2.4.4/bin ]; then
		export ANTSPATH=/opt/ants-2.4.4/bin/
		export PATH=$PATH:${ANTSPATH}
	fi
fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if [[ -d ~/anaconda3 ]]; then
    export ANACONDA_DIRECTORY=~/anaconda3
elif [[ -d ~/opt/anaconda3 ]]; then
    export ANACONDA_DIRECTORY=~/opt/anaconda3
elif [[ -d /opt/anaconda3 ]]; then
    export ANACONDA_DIRECTORY=/opt/anaconda3
elif [[ -d ~/mambaforge ]]; then
    export ANACONDA_DIRECTORY=~/mambaforge
fi

__conda_setup="$('$ANACONDA_DIRECTORY/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "$ANACONDA_DIRECTORY/etc/profile.d/conda.sh" ]; then
        . "$ANACONDA_DIRECTORY/etc/profile.d/conda.sh"
    else
        export PATH="$ANACONDA_DIRECTORY/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# iTerm2 shell integration
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Shell Colors
# Reset
Color_Off='\033[0m'       # Text Reset

# Regular Colors
Black='\033[0;30m'        # Black
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
White='\033[0;37m'        # White

# Bold
BBlack='\033[1;30m'       # Black
BRed='\033[1;31m'         # Red
BGreen='\033[1;32m'       # Green
BYellow='\033[1;33m'      # Yellow
BBlue='\033[1;34m'        # Blue
BPurple='\033[1;35m'      # Purple
BCyan='\033[1;36m'        # Cyan
BWhite='\033[1;37m'       # White

# Underline
UBlack='\033[4;30m'       # Black
URed='\033[4;31m'         # Red
UGreen='\033[4;32m'       # Green
UYellow='\033[4;33m'      # Yellow
UBlue='\033[4;34m'        # Blue
UPurple='\033[4;35m'      # Purple
UCyan='\033[4;36m'        # Cyan
UWhite='\033[4;37m'       # White

# Background
OnBlack='\033[40m'       # Black
OnRed='\033[41m'         # Red
OnGreen='\033[42m'       # Green
OnYellow='\033[43m'      # Yellow
OnBlue='\033[44m'        # Blue
OnPurple='\033[45m'      # Purple
OnCyan='\033[46m'        # Cyan
OnWhite='\033[47m'       # White

# High Intensity
IBlack='\033[0;90m'       # Black
IRed='\033[0;91m'         # Red
IGreen='\033[0;92m'       # Green
IYellow='\033[0;93m'      # Yellow
IBlue='\033[0;94m'        # Blue
IPurple='\033[0;95m'      # Purple
ICyan='\033[0;96m'        # Cyan
IWhite='\033[0;97m'       # White

# Bold High Intensity
BIBlack='\033[1;90m'      # Black
BIRed='\033[1;91m'        # Red
BIGreen='\033[1;92m'      # Green
BIYellow='\033[1;93m'     # Yellow
BIBlue='\033[1;94m'       # Blue
BIPurple='\033[1;95m'     # Purple
BICyan='\033[1;96m'       # Cyan
BIWhite='\033[1;97m'      # White

# High Intensity backgrounds
OnIBlack='\033[0;100m'   # Black
OnIRed='\033[0;101m'     # Red
OnIGreen='\033[0;102m'   # Green
OnIYellow='\033[0;103m'  # Yellow
OnIBlue='\033[0;104m'    # Blue
OnIPurple='\033[0;105m'  # Purple
OnICyan='\033[0;106m'    # Cyan
OnIWhite='\033[0;107m'   # White

