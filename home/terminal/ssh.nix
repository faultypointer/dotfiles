{ variables, ... }:

{
  programs.ssh = {
    enable = true;
    matchBlocks = {
      "github.com" = {
        hostname = "github.com";
        user = "git";
        identityFile = "/home/${variables.username}/.ssh/private/faulty-github";
      };

      "github.com-andsnap" = {
        hostname = "github.com";
        user = "git";
        identityFile = "/home/${variables.username}/.ssh/private/andsnap";
      };

      "gitlab.com" = {
        hostname = "gitlab.com";
        user = "git";
        identityFile = "/home/${variables.username}/.ssh/private/scientiac";
      };

    };
  };
}
