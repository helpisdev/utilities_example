# Build Steps

Once you have followed the instructions to complete the `Getting Started` section in [README.md](README.md), run the code generation:

```bash
dart pub global activate derry
derry gen:build:complete
flutter gen-l10n
```

----------
Finally, build for your platform:

## Android

```bash
flutter build apk --multidex --obfuscate --split-debug-info=build/utilities_example/outputs/symbols --split-per-abi --release --flavor production
```

----------

## Linux

```bash
flutter build linux --obfuscate --split-debug-info=build/utilities_example/production/outputs/symbols --release
```

----------

## Web

```bash
flutter build web --dart2js-optimization O4 --release --csp
```

----------

## Installation

To install run:

```bash
flutter install
```

> The project has not been tested for `windows`, `iOS` and `macos`
