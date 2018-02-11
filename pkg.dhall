let dep = https://raw.githubusercontent.com/vmchale/atspkg/master/pkgs/default-pkg.dhall

in dep //
  { libName = "either"
  , dir = ".atspkg/contrib"
  , url = "https://github.com/vmchale/either/archive/0.1.0.tar.gz"
  , libVersion = [0,1,0]
  }
