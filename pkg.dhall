let makePkg = https://raw.githubusercontent.com/vmchale/atspkg/master/dhall/make-pkg.dhall

in λ(x : List Integer) → 
  makePkg { x = x, name = "either", githubUsername = "vmchale" }
    // { description = [ "Generic sum types and utilities for working with them." ] : Optional Text }
