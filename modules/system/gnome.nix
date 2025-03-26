{ pkgs, ... }:
{
  environment.gnome.excludePackages = with pkgs; [
    gnome-contacts
    gnome-maps
    gnome-characters
    gnome-console
    gnome-contacts
    gnome-music
    gnome-connections
    gnome-software
    gnome-tour
    gnome-user-docs
    gnome-text-editor
    geary
    epiphany
    simple-scan
    snapshot
    totem
    yelp
    file-roller
  ];
}
