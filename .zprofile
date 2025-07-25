export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

eval $(ssh-agent -i)
ssh-add ~/.ssh/gitkey