{ config, pkgs, ... }:
{
	home.username = "assis";
	home.homeDirectory = "/home/assis/";
	#programs.home-manager.enable = true;
	home.stateVersion="21.05";
	home.packages = with pkgs; [
	#	nodejs-16_x
		nox
                direnv
	];
	home.sessionVariables = {
		EDITOR = "vim";
	};

	programs.vim = {
		enable = true;
		settings = {
			number = true;
		};
	};
}

