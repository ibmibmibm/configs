function sd ; sudo -i $argv; end
function j ; jump $argv; end
function fish_user_key_bindings
  bind \cr peco_select_history
end

eval (tmuxifier init - fish)

# Path to your oh-my-fish.
set fish_path $HOME/.oh-my-fish

# Theme
set fish_theme robbyrussell

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-fish/plugins/*)
# Custom plugins may be added to ~/.oh-my-fish/custom/plugins/
# Example format: set fish_plugins autojump bundler
set -gx Z_SCRIPT_PATH /home/beststeve/.local/bin/z.sh
set fish_plugins jump peco percol vundle tmux z

# Path to your custom folder (default path is $FISH/custom)
#set fish_custom $HOME/dotfiles/oh-my-fish

# Load oh-my-fish configuration.
source $fish_path/oh-my-fish.fish
