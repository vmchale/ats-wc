# ats-wc

[![Build Status](https://travis-ci.org/vmchale/ats-wc.svg?branch=master)](https://travis-ci.org/vmchale/ats-wc)

A faster, memory clean version of `wc -l`. This one has fewer features and
exists mostly as a proof-of-concept and demonstration of
[atspkg](http://hackage.haskell.org/package/ats-pkg).

## Benchmarks

You can download the wonderful [bench](https://github.com/Gabriel439/bench) tool
to run the benchmarks.

```
bench "target/ats-wc test/data/ulysses.txt" "wc -l test/data/ulysses.txt"
```
