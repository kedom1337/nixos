{
  pkgs,
  lib,
  osConfig,
  ...
}: {
  programs.chromium = {
    enable = true;
    package = pkgs.ungoogled-chromium;
    commandLineArgs =
      [
        # ungoogled-chromium flags
        "--fingerprinting-canvas-image-data-noise"
        "--fingerprinting-canvas-measuretext-noise"
        "--fingerprinting-client-rects-noise"
        "--hide-crashed-bubble"
        "--popups-to-tabs"
        "--show-avatar-button=never"
        "--disable-search-engine-collection"
        # disable Mv3
        "--disable-features=ExtensionManifestV2Unsupported,ExtensionManifestV2Disabled"
      ]
      # disable all hardware video decoding to fix artifacts on VP8/VP9 with NVIDIA
      ++ lib.optionals osConfig.modules.system.nvidia.enable [
        "--disable-accelerated-video-decode"
      ];
    extensions = [
      {id = "cjpalhdlnbpafiamejdnhcphjbkeiagm";} # ublock origin
      {id = "mnjggcdmjocbbbhaepdhchncahnbgone";} # sponsor block
      {id = "fmkadmapgofadopljbjfkapdkoienihi";} # react dev tools
      {id = "dbepggeogbaibhgnhhndojpepiihcmeb";} # vimium
      {id = "ammjkodgmmoknidbanneddgankgfejfh";} # 7tv
      {id = "dhdgffkkebhmkfjojejmpbldmpobfkfo";} # tampermonkey
      {id = "beakmhbijpdhipnjhnclmhgjlddhidpe";} # linkding
      {id = "nngceckbapebfimnlniiiahkandclblb";} # bitwarden
    ];
  };
}
