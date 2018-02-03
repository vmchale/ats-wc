bench:
    bench "target/ats-wc test/data/ulysses.txt" "wc -l test/data/ulysses.txt"

valgrind:
    valgrind ./target/ats-wc test/data/ulysses.txt
