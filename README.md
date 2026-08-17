# Home Configuration

This repository contains a Nix flake which configures my personal home folder on a MacOS system.

Eventually, I'd like to use this Flake for configuring home on any system since I'll be sharing a lot of the same
packages.

To use this Flake on a new computer, clone this repository into `~/.config/home-manager` and run
`nix run home-manager -- switch` from that directory.

I've also added `home-manager` as a package in the flake, so you could also run `nix develop -c home-manager switch` if
you were so inclined.

This will build and switch your home configuration to the one defined by the flake.

I haven't tested this yet, but after that you should be good-to-go.

