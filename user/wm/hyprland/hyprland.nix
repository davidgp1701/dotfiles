{ config, pkgs, terminal, ...}:

{

  imports = [
    ../../terminal/alacritty/alacritty.nix
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    plugins = [];
    settings = {};
    
    extraConfig = "
      monitor=,preferred,auto,1

      exec = ~/.local/bin/swaybg-stylix

      input {
        kb_file=
        kb_layout=us
        kb_variant=
        kb_model=
	kb_options=caps:swapescape
        kb_rules=

        follow_mouse=1
        
        touchpad {
          natural_scroll=no
        }
        
        sensitivity=0
      }

      # BINDS
      # some nice mouse binds
      bindm=SUPER,mouse:272,movewindow
      bindm=SUPER,mouse:273,resizewindow
      
      # Global Hyperland
      bind=SUPERSHIFT,q,killactive,
      bind=CONTROLALT,q,exit,
      
      # Applications
      #bind=SUPER,RETURN,exec,wezterm
      bind=SUPER,RETURN,exec,"+ terminal +"
      #bind=SUPER,E,exec,thunar
      bind=SUPER,SPACE,exec,wofi --show drun
      
      # Swithc Layout
      #bind=,F12,exec,~/.config/hypr/scripts/switch-layout.sh
      
      # Movements
      bind=SUPER,left,movefocus,l
      bind=SUPER,right,movefocus,r
      bind=SUPER,up,movefocus,u
      bind=SUPER,down,movefocus,d
      
      bind=SUPER,h,movefocus,l
      bind=SUPER,l,movefocus,r
      bind=SUPER,k,movefocus,u
      bind=SUPER,j,movefocus,d
      
      bind=SUPERSHIFT,h,movewindow,l
      bind=SUPERSHIFT,l,movewindow,r
      bind=SUPERSHIFT,k,movewindow,u
      bind=SUPERSHIFT,j,movewindow,d
      
      # Windows
      bind=SUPER,V,togglefloating,
      bind=SUPER,P,pseudo,
      bind=SUPER,f,fullscreen,
      
      bind=SUPERCONTROL,h,resizeactive,-15 0
      bind=SUPERCONTROL,l,resizeactive,15 0
      bind=SUPERCONTROL,j,resizeactive,0 15
      bind=SUPERCONTROL,k,resizeactive,0 -15
      
      # Dwingle layout
      bind=SUPER,g,togglegroup
      bind=SUPER,tab,changegroupactive
      bind=SUPER,t,togglesplit
      
      # Desktop
      bind=SUPER,1,workspace,1
      bind=SUPER,2,workspace,2
      bind=SUPER,3,workspace,3
      bind=SUPER,4,workspace,4
      bind=SUPER,5,workspace,5
      bind=SUPER,6,workspace,6
      bind=SUPER,7,workspace,7
      bind=SUPER,8,workspace,8
      bind=SUPER,9,workspace,9
      bind=SUPER,0,workspace,10
      
      bind=SUPERSHIFT,1,movetoworkspace,1
      bind=SUPERSHIFT,2,movetoworkspace,2
      bind=SUPERSHIFT,3,movetoworkspace,3
      bind=SUPERSHIFT,4,movetoworkspace,4
      bind=SUPERSHIFT,5,movetoworkspace,5
      bind=SUPERSHIFT,6,movetoworkspace,6
      bind=SUPERSHIFT,7,movetoworkspace,7
      bind=SUPERSHIFT,8,movetoworkspace,8
      bind=SUPERSHIFT,9,movetoworkspace,9
      bind=SUPERSHIFT,0,movetoworkspace,10
      
      bind=SUPER,mouse_down,workspace,e+1
      bind=SUPER,mouse_up,workspace,e-1
      
      # Multimedia
      #bind=SUPER,F6,exec,play-control.sh previous
      #bind=SUPER,F7,exec,play-control.sh play-pause
      #bind=SUPER,F8,exec,play-control.sh next
    ";
  };

  home.packages = with pkgs; [
    swaybg
    wdisplays
  ];
}
