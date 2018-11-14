function peco_checkout
    set -l query (commandline)

    if test -n $query
        set peco_flags --layout=top-down --query "$query"
    else
        set peco_flags --layout=top-down
    end

    git branch | peco $peco_flags | xargs git checkout
end
