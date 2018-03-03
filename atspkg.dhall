let prelude = https://raw.githubusercontent.com/vmchale/atspkg/master/ats-pkg/dhall/atspkg-prelude.dhall

in prelude.default //
  { test = 
    [ prelude.bin //
      { src = "test/test.dats"
      , target = "target/test"
      , gcBin = True
      }
    ]
    , dependencies = prelude.mapPlainDeps [ "specats" ]
  }
