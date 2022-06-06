function nixreferences
nix-store --query --references (nix-instantiate '<nixpkgs>' -A $argv[1])
end
