-- https://www.youtube.com/watch?v=M_zMoHlbZBY
return {
  filetypes = { "nix" },
  cmd = { "nixd" },
  root_markers = {
    "configuration.nix",
    "flake.nix",
    ".git",
  },
  settings = {
    nixd = {
      nixpkgs = {
        expr = "import <nixpkgs> { }",
      },
      formatting = {
        command = { "alejandra" }, -- or nixfmt or nixpkgs-fmt
      },
      options = {
        nixos = {
          expr = '(builtins.getFlake "/etc/nixos/flake.nix").nixosConfigurations.default.options',
        },
        home_manager = {
          expr = '(builtins.getFlake "/etc/nixos/flake.nix").homeConfigurations.ilya.options',
        },
      },
    },
  },
}
