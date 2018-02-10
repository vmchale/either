let pkg = https://raw.githubusercontent.com/vmchale/atspkg/master/pkgs/default.dhall
in
let dbin = https://raw.githubusercontent.com/vmchale/atspkg/master/pkgs/default-bin.dhall

in pkg //
  { test = 
    [ dbin //
      { src = "test/either.dats"
      , target = "target/either" 
      }
    ]
  }
