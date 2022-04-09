let prelude =
      https://raw.githubusercontent.com/vmchale/atspkg/master/ats-pkg/dhall/atspkg-prelude.dhall

in  λ(x : List Natural) →
      prelude.makePkgDescr
        { x
        , name = "either"
        , githubUsername = "vmchale"
        , description = "Generic sum types and utilities for working with them."
        }
