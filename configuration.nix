{ ... }:

{
  # Determinate already manages the Nix daemon, so nix-darwin shouldn't.
  nix.enable = false;

  nixpkgs.config.allowUnfree = true;
  nixpkgs.hostPlatform = "aarch64-darwin"; # use x86_64-darwin for Intel CPU

  system.primaryUser = "damian";
  users.users.damian = {
    home = "/Users/damian";
  };
  system.stateVersion = 6;
  system.defaults = {
    NSGlobalDomain = {
      AppleInterfaceStyle = "Dark";
      KeyRepeat = 2;          # fast key repeat
      InitialKeyRepeat = 15;  # short delay before repeat
      _HIHideMenuBar = true;  # auto-hide the menu bar
      AppleShowAllExtensions = true;
    };
    dock.autohide = true;
    finder.FXPreferredViewStyle = "Nlsv";  # list view by default
    finder.CreateDesktop = false;          # clean desktop
    trackpad.Clicking = true;              # tap to click
  };
  nix-homebrew = {
    enable = true;
    user = "damian";
    autoMigrate = true;
  };
  homebrew = {
    enable = true;
    onActivation.cleanup = "zap";  # remove anything not listed here
    onActivation.autoUpdate = true;
    onActivation.extraFlags = [ "--force" ];
    brews = [
      "asdf"
      "aws-vault"
      "awscli"
      "betterleaks"
      "direnv"
      "ffmpeg"
      "gh"
      "gogcli"
      "herdr"
      "libgit2"
      "openai-whisper"
      "poppler"
      "railway"
      "temporal"
      "wget"
    ];
    casks = [
      "claude-code"
      "codex"
      "steipete/tap/codexbar"
      "libreoffice"
      "ngrok"
      "my-monkeys/tap/opensuperwhisper"
      "wezterm"
    ];
  };
}
