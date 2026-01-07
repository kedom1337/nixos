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
      # Disable all hardware video decoding to fix green artifacts on VP8/VP9
      # NVIDIA + VAAPI has known issues with certain codecs
      # Note: --disable-features must appear only once (comma-separated)
      # "--disable-accelerated-video-decode"
      # "--disable-features=VaapiVideoDecoder,ExtensionManifestV2Unsupported,ExtensionManifestV2Disabled"
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
