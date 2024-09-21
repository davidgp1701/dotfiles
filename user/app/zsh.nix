{ config, ... }:

{
  programs.zsh.enable = true;
  programs.zsh.enableCompletion = true;
  programs.zsh.autosuggestion.enable = true;
  programs.zsh.syntaxHighlighting.enable = true;
  programs.zsh.history = {
    size = 10000;
    path = "${config.xdg.dataHome}/zsh/history";
  };
  programs.zsh.shellAliases = {
    ls =  "ls --color";
  };

  programs.dircolors.enable = true;
  programs.dircolors.extraConfig = ''
    TERM alacritty
  ''; # TODO pass this as a variable
  programs.dircolors.enableZshIntegration = true;

  # programs.zsh.initExtra = ''
  #   setopt extended_glob
  #   setopt interactivecomments
  #   unset RPS1
  #   bindkey "^I" complete-word
  #   bindkey "^[l" reset-prompt
  #   bindkey "$(echoti kend)" end-of-line
  #   bindkey "$(echoti khome)" beginning-of-line
  #   bindkey "$(echoti kdch1)" delete-char
  #   function _nix() {
  #       local ifs_bk="$IFS"
  #       local input=("''${(Q)words[@]}")
  #       IFS=$'\n'
  #       local res=($(NIX_GET_COMPLETIONS=$((CURRENT - 1)) "$input[@]"  | sed -e 's/\t$//'))
  #       IFS="$ifs_bk"
  #       local tpe="''${''${res[1]}%%>*}"
  #       local -a suggestions
  #       declare -a suggestions
  #       for suggestion in ''${res:1}; do
  #           # FIXME: This doesn't work properly if the suggestion word contains a `:`
  #           # itself
  #           suggestions+="''${suggestion//:}"
  #       done
  #       if [[ "$tpe" == filenames ]]; then
  #           compadd -f
  #       fi
  #       _describe 'nix' suggestions
  #   }
  #
  #   compdef _nix nix
  #   . ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme
  #   [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
  #   . ${pkgs.zsh-syntax-highlighting}/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  #
  #   # Display $1 in terminal title.
  #   function set-term-title() {
  #     emulate -L zsh
  #     if [[ -t 1 ]]; then
  #       print -rn -- $'\e]0;'${"$"}{(V)1}$'\a'
  #     elif [[ -w $TTY ]]; then
  #       print -rn -- $'\e]0;'${"$"}{(V)1}$'\a' >$TTY
  #     fi
  #   }
  #
  #   # When a command is running, display it in the terminal title.
  #   function set-term-title-preexec() {
  #     if (( P9K_SSH )); then
  #       set-term-title ''${(V%):-"%n@%m: "}$1
  #     else
  #       set-term-title $1
  #     fi
  #   }
  #
  #   # When no command is running, display the current directory in the terminal title.
  #   function set-term-title-precmd() {
  #     if (( P9K_SSH )); then
  #       set-term-title ''${(V%):-"%n@%m: %~"}
  #     else
  #       set-term-title ''${(V%):-"%~"}
  #     fi
  #   }
  #
  #   autoload -Uz add-zsh-hook
  #   add-zsh-hook preexec set-term-title-preexec
  #   add-zsh-hook precmd set-term-title-precmd
  # '';

  programs.starship.enable = true;
  programs.starship.enableZshIntegration = true;
  # programs.starship.settings = {
  #   add_newline = false;
  #   format = "$shlvl$shell$username$hostname$nix_shell$git_branch$git_commit$git_state$git_status$directory$jobs$cmd_duration$character";
  #   shlvl = {
  #     disabled = false;
  #     symbol = "ﰬ";
  #     style = "bright-red bold";
  #   };
  #   shell = {
  #     disabled = false;
  #     format = "$indicator";
  #     fish_indicator = "";
  #     bash_indicator = "[BASH](bright-white) ";
  #     zsh_indicator = "[ZSH](bright-white) ";
  #   };
  #   username = {
  #     style_user = "bright-white bold";
  #     style_root = "bright-red bold";
  #   };
  #   hostname = {
  #     style = "bright-green bold";
  #     ssh_only = true;
  #   };
  #   nix_shell = {
  #     symbol = "";
  #     format = "[$symbol$name]($style) ";
  #     style = "bright-purple bold";
  #   };
  #   git_branch = {
  #     only_attached = true;
  #     format = "[$symbol$branch]($style) ";
  #     symbol = "שׂ";
  #     style = "bright-yellow bold";
  #   };
  #   git_commit = {
  #     only_detached = true;
  #     format = "[ﰖ$hash]($style) ";
  #     style = "bright-yellow bold";
  #   };
  #   git_state = {
  #     style = "bright-purple bold";
  #   };
  #   git_status = {
  #     style = "bright-green bold";
  #   };
  #   directory = {
  #     read_only = " ";
  #     truncation_length = 0;
  #   };
  #   cmd_duration = {
  #     format = "[$duration]($style) ";
  #     style = "bright-blue";
  #   };
  #   jobs = {
  #     style = "bright-green bold";
  #   };
  #   character = {
  #     success_symbol = "[\\$](bright-green bold)";
  #     error_symbol = "[\\$](bright-red bold)";
  #   };
  # };
}
