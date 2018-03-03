let prelude = https://raw.githubusercontent.com/vmchale/atspkg/master/ats-pkg/dhall/atspkg-prelude.dhall

in λ(x : List Integer) → 
  prelude.makePkgDescr
    { x = x
    , name = "either"
    , githubUsername = "vmchale"
    , description = "Generic sum types and utilities for working with them."
    }
