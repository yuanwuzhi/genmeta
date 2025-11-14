{
  description = "gmutils packaged from the GenMeta APT repo";

  inputs.nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

  outputs = { self, nixpkgs }: let
    system = "x86_64-linux";
    pkgs = import nixpkgs { inherit system; };
  in {
    packages.${system}.default = pkgs.stdenv.mkDerivation rec {
      pname = "gmutils";
      version = "0.4.2-1";

      src = pkgs.fetchurl {
        url = "http://download.genmeta.net/ppa/genmeta/pool/main/g/gmutils/gmutils_${version}_amd64.deb";
        sha256 = "sha256-Pqw1co9c+ZDauIN3QxulDQ86CKtnE9uJCMedtC4Dfac=";
      };

      buildInputs = [ pkgs.dpkg ];

      unpackPhase = ''
        dpkg-deb -x $src .
      '';

      installPhase = ''
        mkdir -p $out
        cp -r * $out/

        # Normalize layout: move usr/bin → bin
        if [ -d $out/usr/bin ]; then
          mkdir -p $out/bin
          mv $out/usr/bin/* $out/bin/
          rmdir $out/usr/bin
          rmdir $out/usr || true
        fi
      '';

      meta = {
        description = "gmutils packaged from the GenMeta APT repo";
        platforms = [ "x86_64-linux" ];
      };
    };
  };
}
