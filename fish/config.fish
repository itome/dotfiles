# remove greeting message
set fish_greeting ""

# get along with emacs
function fish_title
  true
end

# emacs ansi-term support
if test -n "$EMACS"
  set -x TERM eterm-color
end

# make peco bottom up
function peco
  command peco --layout=bottom-up $argv
end

# key bindings
function fish_user_key_bindings
  bind \cx\cf peco_z
  bind \cr 'peco_select_history (commandline -b)'
end

alias weather="wget http://wttr.in -O -"

set -g theme_display_date no
set -g theme_title_use_abbreviated_path no
set -g theme_title_display_process no
set -g theme_title_display_path yes
set -g theme_title_display_user no
set -g theme_display_vagrant yes
set -g theme_color_scheme atom-one-dark
set -g fish_prompt_pwd_dir_length 0
set -g theme_project_dir_length 1
set -g theme_git_worktree_support yes
