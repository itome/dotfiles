if [ ! -e "${HOME}/.zplug/init.zsh" ]; then
    curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh| zsh
fi
source ${HOME}/.zplug/init.zsh
source ${HOME}/.profile

zplug 'zsh-users/zsh-syntax-highlighting'
zplug 'zsh-users/zsh-autosuggestions'
zplug "junegunn/fzf-bin", as:command, from:gh-r, rename-to:fzf
zplug "rupa/z", use:z.sh

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi
zplug load --verbose

# --------------
# cdr関連の設定
# --------------
setopt AUTO_PUSHD # cdしたら自動でディレクトリスタックする
setopt pushd_ignore_dups # 同じディレクトリは追加しない
DIRSTACKSIZE=100 # スタックサイズ
# cdr, add-zsh-hook を有効にする
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs

# --------------
# 履歴関連の設定
# --------------
HISTFILE=~/.zsh_history #履歴ファイルの設定
HISTSIZE=1000000 # メモリに保存される履歴の件数。(保存数だけ履歴を検索できる)
SAVEHIST=1000000 # ファイルに何件保存するか
setopt extended_history # 実行時間とかも保存する
setopt share_history # 別のターミナルでも履歴を参照できるようにする
setopt hist_ignore_all_dups # 過去に同じ履歴が存在する場合、古い履歴を削除し重複しない
setopt hist_ignore_space # コマンド先頭スペースの場合保存しない
setopt hist_verify # ヒストリを呼び出してから実行する間に一旦編集できる状態になる
setopt hist_reduce_blanks #余分なスペースを削除してヒストリに記録する
setopt hist_save_no_dups # histryコマンドは残さない
setopt hist_expire_dups_first # 古い履歴を削除する必要がある場合、まず重複しているものから削除
setopt hist_expand # 補完時にヒストリを自動的に展開する
setopt inc_append_history # 履歴をインクリメンタルに追加

# --------------
# propmt
# --------------
eval "$(starship init zsh)"

# cd in history
fd() {
    local res=$(z | sort -rn | cut -c 12- | fzf)
    if [ -n "$res" ]; then
        BUFFER+="cd $res"
        zle accept-line
    else
        return 1
    fi
}
zle -N fd
bindkey '^x^f' fd

# fh - repeat history
h() {
    print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf | sed -r 's/ *[0-9]*\*? *//' | sed -r 's/\\/\\\\/g')
}
zle -N h
bindkey '^x^x' h

## Homebrew Apple silicon
typeset -U path PATH
path=(
	  /opt/homebrew/bin(N-/)
	  /usr/local/bin(N-/)
	  $path
)

if [[ "${(L)$( uname -s )}" == darwin ]] && (( $+commands[arch] )); then
	  alias brew="arch -arch x86_64 /usr/local/bin/brew"
	  alias x64='exec arch -arch x86_64 "$SHELL"'
	  alias a64='exec arch -arch arm64e "$SHELL"'
	  switch-arch() {
		    if  [[ "$(uname -m)" == arm64 ]]; then
			      arch=x86_64
		    elif [[ "$(uname -m)" == x86_64 ]]; then
			      arch=arm64e
		    fi
		    exec arch -arch $arch "$SHELL"
	  }
fi

setopt magic_equal_subst

# Wasmer
export WASMER_DIR="/Users/itome/.wasmer"
[ -s "$WASMER_DIR/wasmer.sh" ] && source "$WASMER_DIR/wasmer.sh"
