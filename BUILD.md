# Build Steps

Once you have followed the instructions to complete the dependencies installation process, run th code generation:

```bash
dart pub global activate derry
derry gen:build:complete
```

----------
Finally, build for your platform:

## Android

```bash
flutter build apk --multidex --obfuscate --split-debug-info=build/utilities_example/outputs/symbols --split-per-abi  --release
```

----------

## Linux

```bash
flutter build linux --obfuscate --split-debug-info=build/utilities_example/outputs/symbols --release
```

----------

## Web

```bash
flutter build web --dart2js-optimization 04 --release --csp
```

----------

## Installation

To install run:

```bash
flutter install
```
