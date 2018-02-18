let makePkg = https://raw.githubusercontent.com/vmchale/atspkg/master/dhall/make-pkg.dhall

in λ(x : List Integer) → 
  makePkg { x = x, name = "either", githubUsername = "vmchale" }
