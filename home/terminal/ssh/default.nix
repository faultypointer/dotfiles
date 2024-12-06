{ variables, ... }:

{
  programs.ssh = {
    enable = true;
    matchBlocks = {
      "github.com" = {
        hostname = "github.com";
        user = "git";
	      identityFile = "/home/${variables.username}/.ssh/github";
      };

	#      "github.com-andsnap" = { 
	#        hostname = "github.com";
	#        user = "git";
	# identityFile = "/home/${variables.username}/.ssh/private/andsnap";
	#      };
	#
	#      "gitlab.com" = {
	#        hostname = "gitlab.com";
	#        user = "git";
	# identityFile = "/home/${variables.username}/.ssh/private/scientiac";
	#      };
	#
	#      "tilde.team" = {
	#        hostname = "tilde.team";
	# identityFile = "/home/${variables.username}/.ssh/private/scientiac";
	#      };
	#
	#      "cosmic.voyage" = {
	#        hostname = "cosmic.voyage";
	# identityFile = "/home/${variables.username}/.ssh/private/scientiac";
	#      };
	#
	#      "hashbang.sh" = {
	#        hostname = "de1.hashbang.sh";
	# identityFile = "/home/${variables.username}/.ssh/private/scientiac";
	#      };
    };
  };
}
