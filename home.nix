{ config, pkgs, ... }:

let
  dotfiles = "${config.home.homeDirectory}/.dotfiles";
  # Skills I write live in their own repo; edits there apply with no rebuild.
  skillsRepo = "${config.home.homeDirectory}/Dev/dalecaru/skills";
  mySkills = [ "unslop" ];  # add a folder name here after creating skills/<name>/SKILL.md
  link = config.lib.file.mkOutOfStoreSymlink;
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
      export PATH="/opt/podman/bin:$PATH"

      bindkey '^f' autosuggest-accept
      eval "$(mise activate zsh)"
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
  home.file = {
    ".config/wezterm".source = link "${dotfiles}/home/.config/wezterm";
    ".config/nvim".source = link "${dotfiles}/home/.config/nvim";
    ".config/herdr".source = link "${dotfiles}/home/.config/herdr";
    ".claude/settings.json".source = link "${dotfiles}/home/.claude/settings.json";

    ".agents/AGENTS.md".source = link "${dotfiles}/home/AGENTS.md";
    ".claude/CLAUDE.md".source = link "${dotfiles}/home/AGENTS.md";
    ".codex/AGENTS.md".source = link "${dotfiles}/home/AGENTS.md";
    ".pi/agent/AGENTS.md".source = link "${dotfiles}/home/AGENTS.md";

    # Third-party skills stay installed by `npx skills add <owner>/<repo>`.
    # Only the lockfile is tracked - `npx skills install` replays it on a new box.
    ".agents/.skill-lock.json".source = link "${dotfiles}/home/.agents/.skill-lock.json";
  }
  # My own skills: symlinked straight out of the skills repo, for Claude and for
  # every other agent that reads ~/.agents/skills.
  // builtins.listToAttrs (builtins.concatMap (s: [
    { name = ".claude/skills/${s}"; value.source = link "${skillsRepo}/skills/${s}"; }
    { name = ".agents/skills/${s}"; value.source = link "${skillsRepo}/skills/${s}"; }
  ]) mySkills);
}
