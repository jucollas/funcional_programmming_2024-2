{ pkgs }: {
  deps = [
    pkgs.haskellPackages.ghc
    pkgs.haskell-language-server
    pkgs.cabal-install
  ];
}