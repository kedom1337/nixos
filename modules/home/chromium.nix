{pkgs, ...}: {
  programs.chromium = {
    enable = true;
    package = pkgs.ungoogled-chromium;
    commandLineArgs = [
      # gpu video acceleration flags
      "--enable-features=AcceleratedVideoEncoder"
      "--ignore-gpu-blocklist"
      "--enable-zero-copy"
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
    ];
    extensions = [
      {id = "cjpalhdlnbpafiamejdnhcphjbkeiagm";} # ublock origin
      {id = "mnjggcdmjocbbbhaepdhchncahnbgone";} # sponsor block
      {id = "fmkadmapgofadopljbjfkapdkoienihi";} # react dev tools
      {id = "dbepggeogbaibhgnhhndojpepiihcmeb";} # vimium
      {id = "ammjkodgmmoknidbanneddgankgfejfh";} # 7tv
      {id = "dhdgffkkebhmkfjojejmpbldmpobfkfo";} # tampermonkey
    ];
  };
}
