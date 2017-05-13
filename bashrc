# ------------------------------
# Bashrc main core for openSUSE
# ------------------------------

test -s ~/.alias && . ~/.alias || true

# -------------------------------------------------------------------------------
# GIT REPO STATUS (link: https://gist.github.com/mcjim/1182950)

function parse_git_dirty {
  [[ $(git status 2> /dev/null | tail -n1) != "nothing to commit, working directory clean" ]] && echo "*"
}
function parse_git_stash {
    [[ $(git stash list 2> /dev/null | tail -n1) != "" ]] && echo "^"
}
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)$(parse_git_stash)/"
}
export PS1='[\u@${HOSTNAME} \w |$(parse_git_branch)|]\> '

# -------------------------------------------------------------------------------
# BASIC ALIAS

# Listing vertically.
alias l='ls -l'

# MacOS style open command.
alias open="xdg-open"

# Display export fix.
alias sudo="sudo DISPLAY=:0"

# Clean Bru3d stuff in folder.
alias cleanbru="rm fort.8* fort.10* fort.11* fort.13* mass.* mfr-* nohup* tec* fort.9* forces* fort.7* s_join* v_join* TEC* n_roadmap* roadmap*"

# Clean every Su2 mess.
alias cleansu2="rm config_* forces_breakdown.dat history.dat restart_flow.dat surface_flow.* flow.dat nohup.out solution_flow.dat"

# Pen-Drive manipulations. [use df to list devices]
alias release="udisksctl unmount -b"
alias turnoff="udisksctl power-off -b"

# List packages in system.
alias lsp="rpm -qa --last"

# Bind the history search as page up and down.
bind '"\e[A":history-search-backward'
bind '"\e[A":history-search-backward'

# Backup line.
alias backup_HD="rsync -arv ~/Carreira ~/Downloads ~/Dropbox ~/Faculdade ~/GitHub ~/GitLab ~/Mestrado ~/Runs ~/Software ~/Templates ~/Videos /run/media/leonardo/BACKUP/backup_avell/"

# -------------------------------------------------------------------------------
# ENVIROMENT VARIABLES

# The BEST editor.
export EDITOR=/usr/bin/vim

# OpenMP GNU compiler. 
export OMP_NUM_THREADS=2

# Define default editor.
export EDITOR=/usr/bin/vim

# Fix compatibility issues with terminal.
export TERM="xterm-256color"

# Export include files.
export PATH=$PATH:/usr/include

# Paraview binaries.
export paraview=/home/leonardo/opt/paraview/bin/paraview
export PATH=$PATH:/home/leonardo/opt/paraview/bin
