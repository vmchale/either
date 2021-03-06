let prelude =
      https://hackage.haskell.org/package/ats-pkg/src/dhall/atspkg-prelude.dhall

in  λ(x : List Natural) →
      prelude.makePkgDescr
        { x
        , name = "either"
        , githubUsername = "vmchale"
        , description = "Generic sum types and utilities for working with them."
        }
