let prelude =
      https://raw.githubusercontent.com/vmchale/atspkg/master/ats-pkg/dhall/atspkg-prelude.dhall sha256:69bdde38a8cc01c91a1808ca3f45c29fe754c9ac96e91e6abd785508466399b4

in    prelude.default
    ⫽ { test =
        [   prelude.bin
          ⫽ { src = "test/test.dats", target = "target/test", gcBin = True }
        ]
      , compiler = [ 0, 4, 0 ]
      , version = [ 0, 3, 13 ]
      , dependencies = prelude.mapPlainDeps [ "specats" ]
      }
