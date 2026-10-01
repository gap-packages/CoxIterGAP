This file describes changes in the CoxIter package.

## Unreleased

- Update the bundled CoxIter to f172859 (#7)
- Revise the build system: support GAP 4.12, accept `--with-gaproot=PATH`,
  stop environment variables like `CXXFLAGS` from overriding required flags,
  and drop `-fopenmp` (#6); support building on macOS and on Windows with
  MinGW/MSYS
- Check bounds for edge weights and vertex indices, and report an error when
  the graph is badly encoded
- Add documentation of the operations and examples to the manual

## 1.0b (2016-08-17)

## 0.1b (2016-08-08)
