# pure prompt settings
set -g async_prompt_functions _pure_prompt_git

function fish_right_prompt_loading_indicator
    echo (set_color '#aaa')' … '(set_color normal)
end

# universal variable are stored in $HOME/.config/fish/fish_variables
#set --universal nvm_default_packages yarn np
#set --universal nvm_default_version v18.9.0

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
  #alias la="exa -la"
  alias la="exa -l -g --icons"
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

# Reset padding/margin to 0 when opening nvim
# TODO: search for fish hook to use in all applications
alias kmp0='kitty @ set-spacing padding=0 margin=0'
# Reset padding/margin to config values when closing nvim
# TODO: store/retrieve from...?
alias kmpV='kitty @ set-spacing padding=20 margin=10'
#vim.api.nvim_command([[ autocmd VimLeave * :silent !kitty @ set-spacing padding=20 margin=10 ]])

# function preexec_test --on-event fish_preexec
#   echo preexec handler: $argv
#   if set -q CMD_DURATION
#   sleep 2s;
#     kitty @ set-spacing padding=0 margin=0
#   end
#   
# end
# 
# function postexec_test --on-event fish_postexec
#   echo postexec handler: $argv
#   kitty @ set-spacing padding=20 margin=10
# end

# if test -q fish_prompt
# 	kitty @ set-spacing padding=120 margin=110
# else
# kitty @ set-spacing padding=0 margin=0
# end

# bat
if type -q bat
  alias cat=bat
end

# nvim 🦾
if type -q nvim
  set -gx EDITOR 'nvim -u NONE'
  set -gx VISUAL nvim
  set -gx MANPAGER "nvim +Man!"
  
  # Padding 0
  alias n='kmp0 && nvim '
  #alias n='nvim '
  #alias nl='nvim -u ~/.config/nvim/init.lua '
  alias vimdiff="n -d"
  # FIX: $XDG_CONFIG_HOME # https://www.reddit.com/r/fishshell/comments/r1r3cn/comment/hm1jqsk/
  alias ncf="n $XDG_CONFIG_HOME/fish/config.fish"
  alias ncn="n $XDG_CONFIG_HOME/nvim/init.lua"
  #alias ncx="n $HOME/System/nixos-config/"
end

set -gx FZF_DEFAULT_COMMAND "rg --files --hidden --follow -g \"!.git/\" 2> /dev/null"
set -gx FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND

set -gx XDG_CONFIG_HOME "$HOME/.config"

# https://github.com/haslersn/any-nix-shell
#any-nix-shell fish --info-right | source

# http://fishshell.com/docs/current/index.html#initialization
# https://stackoverflow.com/questions/26208231/modifying-path-with-fish-shell
# https://fishshell.com/docs/current/tutorial.html#path
# https://fishshell.com/docs/current/tutorial.html#path-example
# https://fishshell.com/docs/current/cmds/fish_add_path.html

set DENO_INSTALL "/home/maxdevjs/.deno"

set -x PATH $HOME/.guix-profile/bin $HOME/.local/bin $DENO_INSTALL/bin $PATH

# https://github.com/jarun/nnn/tree/master/plugins#configuration
#"NNN_FIFO=/tmp/nnn.fifo NNN_PLUG='p:preview-tui' nnn "
set -gx NNN_FIFO /tmp/nnn.fifo

# https://github.com/jarun/nnn/tree/master/plugins#skip-user-confirmation-after-command-execution-
# https://github.com/jarun/nnn/tree/master/plugins#page-non-interactive-command-output-
set NNN_PLUG_COM 't:-!|tree -ps;l:-!|ls -lah --group-directories-first'
set -gx NNN_COLORS '1234' '#0a1b2c3d''#0a1b2c3d;1234'
set NNN_PLUG_DEV 'g:-!git diff*;l:-!git log*;o:!dev-git-open-repo-in-browser*'
set NNN_PLUG_MEDIA 'm:-!|mediainfo $nnn;w:!&mpv $nnn*'
set NNN_PLUG_NNN 'p:preview-tui;u:nmount'
set -gx NNN_PLUG "$NNN_PLUG_DEV;$NNN_PLUG_MEDIA;$NNN_PLUG_NNN"
alias nnn="nnn -i -o -U" 

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






#set DISTRO (lsb_release -a) > /dev/null 2>&1;

#if string match -r 'Solus' $DISTRO
#  echo sooooolus
#end

# Guix
# Temporary workaround to access binaries
# until I do not get it (refer to `how to use guix in fish shell` search)
#set -x GUIX_PROFILE /home/maxdevjs/.guix-profile/bin
#set -x PATH $HOME/Me/system/bin $HOME/.local/bin $HOME/Dev/.node_modules/bin $GUIX_PROFILE $PATH
#source $GUIX_PROFILE/etc/profile

# Nix
#set NIX_LINK $HOME/.nix-profile # 🤔
# https://github.com/lilyball/nix-env.fish

# error: experimental Nix feature 'nix-command' is disabled; use '--extra-experimental-features nix-command' to override
alias nix='nix --extra-experimental-features nix-command --extra-experimental-features flakes '

