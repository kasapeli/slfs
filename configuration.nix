{ pkgs, ... }:

{
  imports =
    [
      ./hardware-configuration.nix
    ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nix";

  networking.networkmanager.enable = true;

  time.timeZone = "Asia/Phnom_Penh";

  security.polkit.enable = true;

  nixpkgs.config.allowUnfree = true;


  programs.steam = {
    enable = true;
    extraCompatPackages = with pkgs; [
      proton-ge-bin
    ];
  };

  programs.gpu-screen-recorder.enable = true;

  services.xserver.enable = true;

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  users.users.sam = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    shell = pkgs.fish;
  };

  environment.systemPackages = with pkgs; [
    pulseaudio
    tmux
    wget
  ];

  services.openssh.enable = true;
  programs.ssh.startAgent = true;

  programs.hyprland.enable = true;
  programs.firefox.enable = true;
  programs.fish.enable = true;

  xdg.portal = {
    enable = true;
  };

  services.power-profiles-daemon.enable = false;

  services.tlp = {
    enable = true;
    settings = {
      CPU_SCALING_GOVERNOR_ON_AC = "performance";
      CPU_SCALING_GOVERNOR_ON_BAT = "performance";

      CPU_MIN_PERF_ON_AC = 0;
      CPU_MAX_PERF_ON_AC = 100;
      CPU_MIN_PERF_ON_BAT = 0;
      CPU_MAX_PERF_ON_BAT = 60;

      START_CHARGE_THRESH_BAT0 = 75;
      STOP_CHARGE_THRESH_BAT0 = 80;
    };
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true;
    extraPackages = with pkgs; [ intel-media-driver vpl-gpu-rt intel-compute-runtime ];
  };

  fonts.packages = with pkgs; [
    corefonts
    vista-fonts
  ];


  system.stateVersion = "26.11";

}

