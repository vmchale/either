let prelude = http://hackage.haskell.org/package/ats-pkg/src/dhall/atspkg-prelude.dhall

in prelude.default ⫽
  { test =
    [ prelude.bin ⫽
      { src = "test/test.dats"
      , target = "target/test"
      , gcBin = True
      }
    ]
    , dependencies = prelude.mapPlainDeps [ "specats" ]
  }
