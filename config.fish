# pure prompt settings
set -g async_prompt_functions _pure_prompt_git

function fish_right_prompt_loading_indicator
    echo (set_color '#aaa')' … '(set_color normal)
end

# set pure_enable_git false

# https://github.com/cirruslabs/docker-images-flutter/
# abbr -a flutter-run 'docker run --rm -it -v {$PWD}:/build --workdir /build cirrusci/flutter:latest flutter run'

# alias flutter-doctor='docker run --rm -it -v {$PWD}:/build --workdir /build cirrusci/flutter:latest flutter doctor'
# alias flutter-emulators='docker run --rm -it -v {$PWD}:/build --workdir /build cirrusci/flutter:latest flutter emulators'
# alias flutter-emulators-create='docker run --rm -it -v {$PWD}:/build --workdir /build cirrusci/flutter:latest flutter emulators --create
# {$argv}'
# alias flutter-test='docker run --rm -it -v {$PWD}:/build --workdir /build cirrusci/flutter:latest flutter test'

# abbr -a flutter-bash 'docker run --rm -it -v ${PWD}:/build --workdir /build --entrypoint bash cirrusci/flutter:latest'

# https://github.com/matsp/docker-flutter/issues/3
# https://github.com/matsp/docker-flutter/issues/2
# https://github.com/matsp/docker-flutter
#abbr -a flutter-run 'docker run --rm -e UID=(id -u) -e GID=(id -g) --workdir /project -v "$PWD":/project matspfeiffer/flutter run'
# alias flutter-create='docker run --rm -e UID=$(id -u) -e GID=$(id -g) --workdir /project -v "$PWD":/project matspfeiffer/flutter create
# {$argv}'
# alias flutter-doctor='docker run --rm -e UID=$(id -u) -e GID=$(id -g) --workdir /project -v "$PWD":/project matspfeiffer/flutter doctor'
# alias flutter-emulator='xhost local:$USER && docker run --rm -ti -e UID=$(id -u) -e GID=$(id -g) -p 42000:42000 --workdir /project --device /dev/kvm --device /dev/dri:/dev/dri -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY -v "$PWD":/project --entrypoint flutter-android-emulator  matspfeiffer/flutter'
# alias flutter-emulators=''
# alias flutter-emulators-create=''
# alias flutter-help='docker run --rm -e UID=$(id -u) -e GID=$(id -g) --workdir /project -v "$PWD":/project matspfeiffer/flutter help'
# alias flutter-help='docker run --rm -e UID=$(id -u) -e GID=$(id -g) --workdir /project -v "$PWD":/project matspfeiffer/flutter help'
# alias flutter-test='docker run --rm -e UID=$(id -u) -e GID=$(id -g) --workdir /project -v "$PWD":/project matspfeiffer/flutter test'

abbr -a c clear
abbr -a flutter-run 'docker run --rm -e UID=$(id -u) -e GID=$(id -g) --workdir /project -v "$PWD":/project --device /dev/bus/usb matspfeiffer/flutter:beta run'
abbr -a flutter-run-emulator 'xhost local:$USER && docker run --rm -ti -e UID=(id -u) -e GID=(id -g) -p 42000:42000 --workdir /project --device /dev/kvm --device /dev/dri:/dev/dri -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY -v "$PWD":/project --entrypoint flutter-android-emulator  matspfeiffer/flutter:beta'
# https://github.com/fish-shell/fish-shell/issues/3907
abbr -a yd 'youtube-dl ""'

alias ks="$XDG_CONFIG_HOME/kitty/sessions/kitty-startup"

if type -q n exa
  alias la="exa -la"
  alias lg="exa --git -l"
  alias lt="exa --tree -D -L 3"
end

# vi mode
fish_vi_key_bindings

# Set the cursor shapes for the different vi modes.
set fish_cursor_default     block      blink
set fish_cursor_insert      line       blink
set fish_cursor_replace_one underscore blink
set fish_cursor_visual      block

# nvim 🦾
if type -q nvim
  set -gx EDITOR nvim
  set -gx VISUAL nvim
  set -gx MANPAGER "nvim +Man! -c ':set signcolumn='"
  
  alias n='nvim '
  alias nl='nvim -u ~/.config/nvimlua/init.lua '
  alias vimdiff="nvim -d"
  alias ncf="nvim $XDG_CONFIG_HOME/fish/config.fish"
  alias ncn="nvim $XDG_CONFIG_HOME/nvim/init.vim"
  alias ncx="nvim $HOME/System/nixos-config/"
end

set -gx FZF_DEFAULT_COMMAND "rg --files --hidden --follow -g \"!.git/\" 2> /dev/null"
set -gx FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND

# https://github.com/haslersn/any-nix-shell
#any-nix-shell fish --info-right | source

# http://fishshell.com/docs/current/index.html#initialization
# https://stackoverflow.com/questions/26208231/modifying-path-with-fish-shell
# https://fishshell.com/docs/current/tutorial.html#path
# https://fishshell.com/docs/current/tutorial.html#path-example
# https://fishshell.com/docs/current/cmds/fish_add_path.html
set -x PATH $HOME/System/dotfiles/bin $HOME/.local/bin $HOME/Dev/.node_modules/bin $PATH

# https://github.com/Olical/dotfiles/blob/master/stowed/.config/fish/config.fish
if type -q direnv
#   eval (direnv hook fish)
  direnv hook fish | source
end

# TODO: https://github.com/folke/tokyonight.nvim/blob/main/extras/fish_tokyonight_night.fish

# https://github.com/oh-my-fish/oh-my-fish/blob/master/pkg/omf/functions/themes/omf.theme.set.fish
# https://github.com/oh-my-fish/oh-my-fish/blob/master/pkg/omf/functions/cli/omf.cli.theme.fish
# https://github.com/oh-my-fish/oh-my-fish/blob/master/pkg/omf/functions/themes/omf.theme.set.fish
# https://github.com/pure-fish/pure#-colours
# https://fishshell.com/docs/current/cmds/set_color.html
# source $XDG_CONFIG_HOME/fish/themes/fish_tokyonight_storm.fish

# TODO: port https://github.com/mvllow/dots/blob/main/guides/update-kitty-config-from-neovim.md
