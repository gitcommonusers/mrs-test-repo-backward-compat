# mrs-test-repo-backward-compat

Test repository for MRT CT-1: Detect backward compatibility issues.

## Purpose

Contains tests that exercise MATLAB R2024b+ functionality (`dictionary` with
`entries(d,"table")` syntax). When run across multiple releases:

- **R2025b**: All tests pass
- **R2024a**: `testNewFunctionality` fails (feature not available), `testBaselinePasses` passes

## Structure

```
tests/
  tBackwardCompat.m    % matlab.unittest.TestCase with 2 tests
```

## Usage with MRT

```matlab
m = mrs.mrt(Url="https://github.com/gitcommonusers/mrs-test-repo-backward-compat.git", ...
    Releases="R2025b,R2024a");
r = m.run();
% Expected: r.R2025b.Passed == true, r.R2024a.Passed == false
```
