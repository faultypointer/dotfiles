{ pkgs, inputs, ... }:
{
    programs.firefox = {
	enable = true;
	package = pkgs.wrapFirefox pkgs.firefox-unwrapped {
	    extraPolicies = {
		CaptivePortal = false;
		DisableFirefoxStudies = true;
		DisablePocket = true;
		DisableTelemetry = true;
		DisableFirefoxAccounts = false;
		NoDefaultBookmarks = true;
		OfferToSaveLogins = false;
		OfferToSaveLoginsDefault = false;
		PasswordManagerEnabled = false;
		FirefoxHome = {
		    Search = true;
		    Pocket = false;
		    Snippets = false;
		    TopSites = false;
		    Highlights = false;
		};
		UserMessaging = {
		    ExtensionRecommendations = false;
		    SkipOnboarding = true;
		};
	    };
	};
	profiles = {
	    default = {
	    id = 0;
	    name = "hypercube";
	    isDefault = true;
	    settings = {
		"browser.startup.homepage" = "https://faultypointer.github.io/Bento/";
		"browser.search.defaultenginename" = "duckduckgo";
		"browser.search.order.1" = "Searx";
		"browser.shell.checkDefaultBrowser" = false;
		"browser.shell.defaultBrowserCheckCount" = 1;
		"browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
		"widget.use-xdg-desktop-portal.file-picker" = 1;
		"widget.use-xdg-desktop-portal.mime-handler" = 1;
	    };
	    extensions = with inputs.firefox-addons.packages.${pkgs.system}; [
		ublock-origin
		bitwarden
		vimium
	    ];
	    settings = {
		"toolkit.legacyUserProfileCustomizations.stylesheets" = true;
		"browser.tabs.drawInTitlebar" = true;
		"svg.context-properties.content.enabled" = true;
		"general.smoothScroll" = true;
	    };
	    extraConfig = ''
		user_pref("full-screen-api.ignore-widgets", true);
		user_pref("media.ffmpeg.vaapi.enabled", true);
		user_pref("media.rdd-vpx.enabled", true);
	    '';
	    };
	};

    };
}
