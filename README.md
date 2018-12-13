<!-- DO NOT EDIT THIS FILE -->
<!-- edit funlangs.hs instead -->

# Functional languages

There is no such thing as a functional language.
There are only languages with different functional features.

## Functional features

| Feature | Assembler | C | C++ | Haskell | Idris | Java | OCaml | Python | Rust | Scala |
|---|---|---|---|---|---|---|---|---|---|---|
| Closures | :x: | :x: | :warning: | :heavy_check_mark: | :heavy_check_mark: |  | :heavy_check_mark: | :heavy_check_mark: | :warning: | :heavy_check_mark: |
| Downwards Funarg Problem | :x: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: |
| Functions | :x: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: |
| Lambda Abstraction Syntax | :x: | :x: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :warning: | :heavy_check_mark: | :heavy_check_mark: |
| Polymorphic Recursion | :x: |  |  |  | :heavy_check_mark: |  | :heavy_check_mark: |  |  |  |
| Pure Functions | :x: | :x: | :warning: | :heavy_check_mark: | :heavy_check_mark: | :x: | :x: | :x: | :x: | :x: |
| Tail Call Optimization | :x: |  |  | :heavy_check_mark: | :heavy_check_mark: | :x: |  |  |  |  |
| Upwards Funarg Problem | :x: | :x: | :warning: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: |

## Non-functional features

| Feature | Assembler | C | C++ | Haskell | Idris | Java | OCaml | Python | Rust | Scala |
|---|---|---|---|---|---|---|---|---|---|---|
| Ad Hoc Polymorphism |  | :x: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: |  | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: |  |
| Algebraic Data Types |  | :x: | :x: | :heavy_check_mark: | :heavy_check_mark: |  | :heavy_check_mark: | :x: | :heavy_check_mark: |  |
| Dependent Types |  | :x: | :x: | :x: | :heavy_check_mark: |  | :x: | :x: | :x: |  |
| Forces Immutability |  | :x: | :x: | :heavy_check_mark: | :heavy_check_mark: |  | :heavy_check_mark: | :x: | :heavy_check_mark: |  |
| Immutable Data |  | :x: | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: |  | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: |  |
| Laziness |  | :x: | :x: | :heavy_check_mark: | :x: |  | :x: | :x: | :x: |  |
| Parametric Modules |  | :x: | :x: | :warning: | :heavy_check_mark: |  |  | :x: | :x: |  |
| Parametric Polymorphism |  |  | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: |  | :heavy_check_mark: | :heavy_check_mark: | :heavy_check_mark: |  |
| Pattern Matching |  |  | :warning: | :heavy_check_mark: | :heavy_check_mark: |  |  | :warning: | :warning: |  |
| Pattern Matching Alternatives |  |  |  | :heavy_check_mark: | :x: |  |  |  | :heavy_check_mark: |  |
| Pattern Matching Variable Introduction |  |  |  | :heavy_check_mark: | :heavy_check_mark: |  |  | :heavy_check_mark: | :heavy_check_mark: |  |
| Referential Transparency |  |  |  |  | :heavy_check_mark: |  |  |  |  |  |
| Totality Checking |  | :x: | :x: | :x: | :heavy_check_mark: |  | :x: | :x: | :x: |  |
| Uniqueness Types |  | :x: | :x: | :x: | :heavy_check_mark: |  | :x: | :x: | :heavy_check_mark: |  |
| Universe Polymorphism |  | :x: | :x: | :x: | :heavy_check_mark: |  | :x: | :x: | :x: |  |

## Scores

A well implemented feature counts as 1,
a badly implemented counts as 0.5.

| Language | Score |
|----------|-------|
| Idris | 8.0 |
| Haskell | 7.0 |
| OCaml | 6.0 |
| Scala | 5.0 |
| Rust | 4.5 |
| Python | 4.5 |
| C++ | 4.5 |
| Java | 4.0 |
| C | 2.0 |
| Assembler | 0.0 |

