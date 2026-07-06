{ config, pkgs, ... }:

let
  dotfiles = "${config.home.homeDirectory}/.dotfiles";
in

{
  home.username = "damian";
  home.homeDirectory = "/Users/damian";
  home.stateVersion = "24.11";
  home.packages = with pkgs; [
    # cli i use constantly
    ripgrep   # fast search
    fd        # fast find
    fzf       # fuzzy finder
    jq        # json on the command line
    lazygit
    neovim
    # the font everything renders in
    nerd-fonts.hack
  ];
  fonts.fontconfig.enable = true;
  home.sessionVariables.EDITOR = "nvim";

  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;      # ghost text from history
    syntaxHighlighting.enable = true;  # commands turn green when valid
    initContent = ''
      bindkey '^f' autosuggest-accept
    '';
    shellAliases = {
      ".." = "cd ..";
      add = "git add .";
      push = "git push";
      pull = "git pull";
      m = "git switch main";
    };
  };

  programs.git = {
    enable = true;

    settings = {
      # Identity
      user.name  = "damiancaruso";
      user.email = "damian@damiancaruso.com";
      user.signingkey = "${config.home.homeDirectory}/.ssh/id_ed25519.pub";

      # SSH-based signing via 1Password (or other SSH agent)
      gpg.format = "ssh";
      "gpg \"ssh\"".program = "/Applications/1Password.app/Contents/MacOS/op-ssh-sign";

      # Do not auto-sign every commit; use `git commit -S` when desired
      commit.gpgsign = false;

      # Color
      color.ui = "auto";

      # Alias section (Git-style)
      alias.st = "status -sb";
      alias.ci = "commit";
      alias.cm = "commit -m";
      alias.br = "branch";
      alias.co = "checkout";
      alias.df = "diff";
      alias.lg = "log --graph --pretty=format:'%Cred%h%Creset %Cgreen[%cr]%Creset (%an) %s%Creset %C(yellow)%d%Creset' --abbrev-commit --date=relative";

      # Push
      push.default = "simple";

      # Diff
      diff.wordRegex = "[^[:space:]]";

      # Apply
      apply.whitespace = "nowarn";

      # Format
      format.pretty = "%Cblue%h%Creset %Cgreen[%ar]%Creset (%an) %s";

      # Rebase
      rebase.autosquash = true;

      # Core
      core.editor = "nvim";

      # Init
      init.defaultBranch = "main";
    };
  };

  programs.starship = {
    enable = true;
    settings = {
      add_newline = false;
      format = "$directory$git_branch$git_status$cmd_duration$line_break$character";
      character = {
        success_symbol = "[❯](purple)";
        error_symbol = "[❯](red)";
      };
      cmd_duration.format = "[$duration]($style) ";
    };
  };

  # Edit-in-place: the real file stays in my repo, ~/.config just points at it.
  home.file.".config/wezterm".source =
    config.lib.file.mkOutOfStoreSymlink "${dotfiles}/home/.config/wezterm";
  home.file.".config/nvim".source =
    config.lib.file.mkOutOfStoreSymlink "${dotfiles}/home/.config/nvim";
  home.file.".config/herdr".source =
    config.lib.file.mkOutOfStoreSymlink "${dotfiles}/home/.config/herdr";
  home.file.".claude/settings.json".source =
    config.lib.file.mkOutOfStoreSymlink "${dotfiles}/home/.claude/settings.json";

  home.file.".claude/CLAUDE.md".source =
    config.lib.file.mkOutOfStoreSymlink "${dotfiles}/home/AGENTS.md";
  home.file.".codex/AGENTS.md".source =
    config.lib.file.mkOutOfStoreSymlink "${dotfiles}/home/AGENTS.md";
  home.file.".config/opencode/AGENTS.md".source =
    config.lib.file.mkOutOfStoreSymlink "${dotfiles}/home/AGENTS.md";
}
