if status is-interactive
    bind ctrl-f tmux-sessionizer repaint
    set PATH ~/.local/bin $PATH
    alias hx helix
    pyenv init - fish | source

    export SSH_AUTH_SOCK=/home/work/.1password/agent.sock
    export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/docker.sock
    export EDITOR=helix
end
