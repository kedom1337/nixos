{
  programs.chromium = {
    enable = true;
    commandLineArgs = [
      "--enable-features=AcceleratedVideoEncoder"
      "--ignore-gpu-blocklist"
      "--enable-zero-copy"
    ];
    extensions = [
      { id = "cjpalhdlnbpafiamejdnhcphjbkeiagm"; } # ublock origin
      { id = "mnjggcdmjocbbbhaepdhchncahnbgone"; } # sponsor block
    ];
  };
}
