{
 programs.newsboat = {
		enable = true;
		autoReload = true;
		extraConfig = "
		    # unbind keys
		    unbind-key ENTER
		    unbind-key j
		    unbind-key k
		    unbind-key J
		    unbind-key K

		    # bind keys - vim style
		    bind-key j down
		    bind-key k up
		    bind-key l open
		    bind-key h quit
		";

		urls = [
			{
			title = "XKCD";
			tags = [
			    "Fun"
			];
			url = "https://xkcd.com/atom.xml";
		    }
		];
	};
}
