cp ~/Documents/scripts/.vimrc ~/.vimrc
export ZSH="/Users/conoel/.oh-my-zsh"
ZSH_THEME="robbyrussell"
plugins=(git)
source $ZSH/oh-my-zsh.sh
alias poule="git pull"
alias gp="git pull"
alias ga="git add ."
alias gc="git commit -m"
alias gp="git push"
alias m="make"
alias mr="make re"
alias norme="sh ~/Documents/scripts/.norme.sh"
alias cloneP="sh ~/Documents/scripts/.cloneP.sh"
export PATH=$HOME/.brew/bin:$PATH
