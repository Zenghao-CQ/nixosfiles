{
  description = "Alex NixOS flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
    };
    hyprland.url = "github:hyprwm/Hyprland";
  };

  outputs = inputs@{ self, nixpkgs, home-manager, hyprland, ... }: {
    # 使用 hostname
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      specialArgs = {inherit inputs hyprland;};
      modules = [
        ./nixos/configuration.nix

        # 将 home-manager 配置为 nixos 的一个 module
        # 这样在 nixos-rebuild switch 时，home-manager 配置也会被自动部署
        home-manager.nixosModules.home-manager
        {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.alex = import ./home/home.nix;
          # 使用 home-manager.extraSpecialArgs 自定义传递给 ./home.nix 的参数
          # 取消注释下面这一行，就可以在 home.nix 中使用 flake 的所有 inputs 参数了
          # home-manager.extraSpecialArgs = inputs;
        }
      ];
    };
  };
}
