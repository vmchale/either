let prelude =
      https://raw.githubusercontent.com/vmchale/atspkg/master/ats-pkg/dhall/atspkg-prelude.dhall sha256:c04fe26a86f2e2bd5c67c17f213ee30379d520f5fad11254a8f17e936250e27e

in    prelude.default
    ⫽ { test =
        [   prelude.bin
          ⫽ { src = "test/test.dats", target = "target/test", gcBin = True }
        ]
      , compiler = [ 0, 4, 0 ]
      , version = [ 0, 3, 13 ]
      , dependencies = prelude.mapPlainDeps [ "specats" ]
      }
