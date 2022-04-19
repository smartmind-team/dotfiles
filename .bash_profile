HOST_NAME=lazyduo

# shopt -s autocd
# shopt -s histappend

export HISTSIZE=5000
export HISTFILESIZE=10000

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

txtred='\e[0;31m'  # Red
txtgrn='\e[0;32m'  # Green
bldgrn='\e[1;32m'  # Bold Green
bldblue='\e[1;34m' # Bold Blue
bldpur='\e[1;35m'  # Bold Purple
txtrst='\e[0m'     # Text Reset

print_before_the_prompt () {
    dir=$PWD
    home=$HOME
    dir=${dir/"$HOME"/"~"}
    printf "\n $txtred%s: $bldblue%s $txtgrn%s\n$txtrst" "$HOST_NAME" "$dir" "$(vcprompt)"
}

PROMPT_COMMAND=print_before_the_prompt
PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
PS1=">"

# Cowsay for fun.
fortune | cowsay

# Aliases
# alias rs="cd /sample/path/project && uvicorn app.main:app --reload --host 0.0.0.0 --port 8000"