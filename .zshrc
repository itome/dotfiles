# --------------
# 環境変数の設定
# --------------
export ANDROID_HOME=$HOME/Library/Android/sdk
export PYENV_ROOT=$HOME/.pyenv
export GOPATH=$HOME/go
export WASMTIME_HOME=$HOME/.wasmtime
export PATH=$PATH:$PYENV_ROOT/shims
export PATH=$PATH:$HOME/flutter/bin
export PATH=$PATH:$HOME/flutter/bin/cache/dart-sdk/bin
export PATH=$PATH:$HOME/.pub-cache/bin
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$HOME/dotfiles/commands
export PATH=$PATH:$HOME/.composer/vendor/bin
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:$HOME/opt/local
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOPATH/src/bin
export PATH=$PATH:$HOME/.roswell/bin
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:/usr/local/opt/llvm/bin
export PATH=$PATH:$WASMTIME_HOME/bin
export PATH=$PATH:/opt/homebrew/bin
export PATH=$PATH:$HOME/.con
export PATH=$PATH:$HOME/.local/share/solana/install/active_release/bin
export PATH=$PATH:/opt/homebrew/opt/llvm/bin
export PATH=$PATH:/opt/homebrew/opt/openjdk@11/bin
export PATH=$PATH:$HOME/.bun/bin
export PATH=$PATH:$HOME/Projects/chromium.googlesource.com/chromium/tools/depot_tools

. "$HOME/.cargo/env"
export GO111MODULE=on
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
export LDFLAGS="-L/opt/homebrew/opt/llvm/lib"
export CPPFLAGS="-I/opt/homebrew/opt/llvm/include"
export CPPFLAGS="-I/opt/homebrew/opt/openjdk@11/include"
export LIBRARY_PATH="$LIBRARY_PATH:$(brew --prefix)/lib"

export NVM_DIR=$HOME/.nvm
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

if [ -f '/Users/itome/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/itome/google-cloud-sdk/path.zsh.inc'; fi
if [ -f '/Users/itome/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/itome/google-cloud-sdk/completion.zsh.inc'; fi

[ -s "/Users/itome/.bun/_bun" ] && source "/Users/itome/.bun/_bun"
# --------------

eval "$(sheldon source)"
eval "$(starship init zsh)"
eval "$(direnv hook zsh)"
eval "$(pyenv init -)"
eval "$(rbenv init - zsh)"

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

# cd in history
find_project() {
    local res=$(ghq list | fzf --preview "bat --color=always --style=header,grid --line-range :80 $(ghq root)/{}/README.*")
    if [ -n "$res" ]; then
        BUFFER+="cd $(ghq root)/$res"
        zle accept-line
    else
        return 1
    fi
}
zle -N find_project
bindkey '^x^f' find_project

# fh - repeat history
repeat_history() {
    local res=$(([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf | sed -r 's/ *[0-9]*\*? *//' | sed -r 's/\\/\\\\/g')
    if [ -n "$res" ]; then
        BUFFER+=$res
        zle accept-line
    else
        return 1
    fi
}
zle -N repeat_history
bindkey '^x^x' repeat_history
