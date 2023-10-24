# skogen.zsh-theme

# TODO: Need to add some docs up here

# You can set your computer name in the ~/.box-name file if you want.

# Adapted from https://github.com/ohmyzsh/ohmyzsh/blob/master/themes/fino.zsh-theme

function virtualenv_prompt_info {
  [[ -n ${VIRTUAL_ENV} ]] || return
  echo "${ZSH_THEME_VIRTUALENV_PREFIX:=[}${VIRTUAL_ENV:t}${ZSH_THEME_VIRTUALENV_SUFFIX:=]}"
}

function prompt_char {
  command git branch &>/dev/null && echo "±" || echo '○'
}

function box_name {
  local box="${SHORT_HOST:-$HOST}"
  [[ -f ~/.box-name ]] && box="$(< ~/.box-name)"
  echo "${box:gs/%/%%}"
}

local ruby_env='$(ruby_prompt_info)'
local git_info='$(git_prompt_info)'
local prompt_char='$(prompt_char)'

PROMPT="╭─$fg_bold[green]%n@$fg_bold[green]$(box_name)%{$reset_color%}─$fg_bold[yellow]%B%~%b${git_info}${ruby_env}
╰─${prompt_char}%{$reset_color%} "

ZSH_THEME_GIT_PROMPT_PREFIX=" %{$reset_color%} "
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="${FG[202]} ●●"
ZSH_THEME_GIT_PROMPT_CLEAN="${FG[040]} ●"

ZSH_THEME_RUBY_PROMPT_PREFIX=" ${FG[239]}using${FG[243]} ‹"
ZSH_THEME_RUBY_PROMPT_SUFFIX="›%{$reset_color%}"

export VIRTUAL_ENV_DISABLE_PROMPT=1
ZSH_THEME_VIRTUALENV_PREFIX=" ${FG[239]}using${FG[243]} «"
ZSH_THEME_VIRTUALENV_SUFFIX="»%{$reset_color%}"
