# either

[![Build Status](https://travis-ci.org/vmchale/either.svg?branch=master)](https://travis-ci.org/vmchale/either)

This is a library providing something like
[Data.Either](https://hackage.haskell.org/package/base-4.10.1.0/docs/Data-Either.html)
for Haskell.

It's not really complete yet, but it's probably useful in its current state
anyhow (do beware of un-implemented templates).

## Use

With [atspkg](https://github.com/vmchale/atspkg), you can simply add
a `dependencies` field to your `atspkg.dhall` like so:

```
let pkg = https://raw.githubusercontent.com/vmchale/atspkg/master/pkgs/default.dhall
in
let dbin = https://raw.githubusercontent.com/vmchale/atspkg/master/pkgs/default-bin.dhall

in pkg //
  { bin =
    [ dbin //
      { src = "src/ats-wc.dats"
      , target = "target/ats-wc"
      , gcBin = True
      }
    ]
    , dependencies = [ "either" ]
  }
```

As `either` is a high-level library, you should be sure to use garbage
collection!
