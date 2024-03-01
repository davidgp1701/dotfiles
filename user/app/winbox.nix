{ config, pkgs, ...}:

{
  home.packages = with pkgs; [
    # Use the following command to copy:
    #  wl-paste -t text -w sh -c 'v=$(cat); cmp -s <(xclip -selection clipboard -o) <<< "$v" || xclip -selection clipboard <<< "$v"'
    # until the  following issue is fixed:
    #   https://github.com/hyprwm/Hyprland/issues/2319
    wl-clipboard
    xclip
    winbox
  ];
}
