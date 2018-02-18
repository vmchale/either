let prelude = https://raw.githubusercontent.com/vmchale/atspkg/master/dhall/atspkg-prelude.dhall

in prelude.default //
  { test = 
    [ prelude.bin //
      { src = "test/test.dats"
      , target = "target/test"
      , gcBin = True
      }
    ]
    , compiler = [0,3,10]
    , dependencies = prelude.mapPlainDeps [ "specats" ]
  }
