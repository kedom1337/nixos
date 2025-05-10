let
  leader = "space";
in
{
  programs.zed-editor = {
    enable = true;
    extensions = [
      "html"
      "nix"
      "material-icon-theme"
      "nvim-nightfox"
    ];
    userSettings = {
      vim_mode = true;
      buffer_font_size = 14;
      tab_bar.show = false;
      assistant = {
        default_model = {
          provider = "copilot_chat";
          model = "claude-3-7-sonnet";
        };
        version = "2";
      };
      telemetry = {
        metrics = false;
        diagnostics = false;
      };
      icon_theme = "Material Icon Theme";
      theme = {
        mode = "system";
        light = "Dayfox";
        dark = "Carbonfox";
      };
    };
    userKeymaps = [
      {
        context = "Editor && (vim_mode == normal || vim_mode == visual) && !menu";
        bindings = {
          "${leader} q" = "pane::CloseActiveItem";
          "${leader} w" = "workspace::Save";
          "${leader} e" = "pane::RevealInProjectPanel";
          "${leader} g" = "git_panel::ToggleFocus";
          "${leader} a" = "assistant::ToggleFocus";
          "${leader} t" = "terminal_panel::ToggleFocus";
          s = "vim::PushSneak";
          shift-s = "vim::PushSneakBackward";
        };
      }
    ];
  };
}
