# just is a command runner, Justfile is very similar to Makefile, but simpler.

# use nushell for shell commands
set shell := ["nu", "-c"]


############################################################################
#
#  Common commands(suitable for all machines)
#
############################################################################

# update all the flake inputs
up:
  nix flake update

# Update specific input
# Usage: just upp nixpkgs
upp input:
  nix flake update {{input}}

# List all generations of the system profile
history:
  nix profile history --profile /nix/var/nix/profiles/system

# Open a nix shell with the flake
repl:
  nix repl -f flake:nixpkgs

# remove all generations older than 7 days
clean:
  sudo nix profile wipe-history --profile /nix/var/nix/profiles/system  --older-than 7d

# Garbage collect all unused nix store entries
gc:
  sudo nix store gc --debug
  sudo nix-collect-garbage --delete-old

# Remove all reflog entries and prune unreachable objects
gitgc:
  git reflog expire --expire-unreachable=now --all
  git gc --prune=now


############################################################################
#
#  Misc, other useful commands
#
############################################################################

path:
   $env.PATH | split row ":"
