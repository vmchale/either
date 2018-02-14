let pkg = https://raw.githubusercontent.com/vmchale/atspkg/master/pkgs/default.dhall
in
let dbin = https://raw.githubusercontent.com/vmchale/atspkg/master/pkgs/default-bin.dhall

in pkg //
  { test = 
    [ dbin //
      { src = "test/test.dats"
      , target = "target/test"
      , gcBin = True
      }
    ]
    , compiler = [0,3,10]
    , dependencies = [ "specats" ]
  }
