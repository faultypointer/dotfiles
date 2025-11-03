# Mime allows us to configure the default applications for each file type
{
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "text/markdown" = "nvim.desktop";
      "text/plain" = "nvim.desktop";
      "text/x-shellscript" = "nvim.desktop";
      "text/x-python" = "nvim.desktop";
      "text/x-go" = "nvim.desktop";
      "text/css" = "nvim.desktop";
      "text/javascript" = "nvim.desktop";
      "text/x-c" = "nvim.desktop";
      "text/x-c++" = "nvim.desktop";
      "text/x-java" = "nvim.desktop";
      "text/x-rust" = "nvim.desktop";
      "text/x-yaml" = "nvim.desktop";
      "text/x-toml" = "nvim.desktop";
      "text/x-dockerfile" = "nvim.desktop";
      "text/x-xml" = "nvim.desktop";
      "text/x-php" = "nvim.desktop";
      "image/jpeg" = "imv.desktop";
      "image/jpg" = "imv.desktop";
      "image/webp" = "imv.desktop";
      "image/gif" = "firefox-beta.desktop";
      "x-scheme-handler/http" = "firefox-beta.desktop";
      "x-scheme-handler/https" = "firefox-beta.desktop";
      "text/html" = "firefox-beta.desktop";
      "application/pdf" = "zathura.desktop";
      "image/png" = "imv-dir.desktop";
      "x-scheme-handler/chrome" = "firefox-beta.desktop";
      "application/x-extension-htm" = "firefox-beta.desktop";
      "application/x-extension-html" = "firefox-beta.desktop";
      "application/x-extension-shtml" = "firefox-beta.desktop";
      "application/xhtml+xml" = "firefox-beta.desktop";
      "application/x-extension-xhtml" = "firefox-beta.desktop";
      "application/x-extension-xht" = "firefox-beta.desktop";
    };
  };
}
