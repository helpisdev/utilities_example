# Contributing to utilities_example

Thanks for your interest in contributing to utilities_example.

There are many ways that you can contribute:

- Reporting issues
- Updating documentation
- Sharing use cases in Revolt or Reddit
- Bug fix or feature enhancement

If you haven't already, join our Revolt workspace [here](), we would love to discuss topics that need community contribution and enhancements to existing features.

## Contents

- [Contributing to utilities_example](#contributing-to-utilities_example)
  - [Contents](#contents)
  - [Code of conduct](#code-of-conduct)
  - [Directory structure](#directory-structure)
  - [Development setup](#development-setup)
    - [Requirements](#requirements)
    - [Local utilities_example setup](#local-utilities_example-setup)
    - [Test suite](#test-suite)
  - [Checklist before submitting a PR](#checklist-before-submitting-a-pr)
  - [Contributor License Agreement](#contributor-license-agreement)

## Code of conduct

This project and everyone participating in it are governed by the Code of
Conduct which can be found in the file [CODE_OF_CONDUCT.md](CODE_OF_CONDUCT.md).
By participating, you are expected to uphold this code. Please report
unacceptable behavior to community@utilities_example.io.

## Directory structure

The utilities_example project monorepo is organized to maintain most of its individual dependencies code within their directories, except for a few auxiliary or shared packages. Versioning, package linking, and changelogs are handled through `melos`. Each package is organized by *feature/component* logic, grouping and modularizing related behavior. Features can be sub-modularized further into sub-features, if deemed necessary. Every feature (or sub-feature), should contain two required folders: an __api__ and an __internal__ folder. The api folder depends on the internal folder, and all other packages that need to depend to this feature, interface with it through the api folder. While the internal folder can change its api any way necessary, changes to the api folder cannot be *__destructive__*. Thus, commits to an api folder should be thoroughly reasoned and reviewed. By destructive, we mean changes that either __remove__ an api function or __change__ its *signature*. If a function must undergo such changes, the function should not be removed or changed, but rather marked `deprecated`, and a brand new function should be generated to implement the new required functionality. For internal package communication, we prefer `gRPC`. We do not impose any other constraint on project structure and architecture to enable developer freedom and not inhibit productivity. General guidelines to consider though are:

1. Separate logic, state, and presentation to different files,
2. Do not create unnecessary proxy classes,
3. Abstract logic only when its repeated more than 2 times,
4. Have as clear as possible code boundaries,
5. Do not depend to other packages if you can avoid it,
6. Document any public member,
7. Add comments to explain an algorithmic process, but *do not* overdo it,
8. KISS (__keep it simple stupid__),
9. Avoid overly long functions, classes, files, but *do not* prematurely abstract logic,
10. Avoid complex solutions, prefer less code and less files,
11. Aim for 100% code coverage.

If you follow these guidelines and also comply with the styleguide, any reasonable change will probably be accepted and much appreciated.

The most important directories are:

- [/.github](/.github) - Github actions workflow files and issue templates
- [/lib/src](/lib/src) - Core source
- [/packages](/packages) - Features
- [/packages/common](/packages/common) - Shared and auxiliary packages.
- [/proto](/proto) - Protobuf files that complement features.
- [/test/features](/test/features) - Feature files that describe business use cases.

## Development setup

If you want to contribute to bug fixes or improve existing features, you have to ensure that all needed
dependencies are installed. Here is a short guide on how that can be done.

### Requirements

#### Dart 3.0.0

Follow the installation guide from <https://dart.dev/>

#### Flutter 3.10.0

We use the flutter framework in our UI client. You can follow its requirement guide to have all its dependencies installed: <https://flutter.dev/>

#### gRPC

You can follow the instructions from the quickstarter guide <https://grpc.io/docs/languages/dart/quickstart/#prerequisites> and then run the `generate.sh` files located in each `proto` directory to generate changes.

#### Docker

Follow the installation guide from <https://docs.docker.com/get-docker/>

### Local utilities_example setup

> __IMPORTANT__: All the steps below have to get executed at least once to get the development setup up and running!

Now that everything utilities_example requires to run is installed, the actual utilities_example code can be
checked out and set up:

1. [Fork](https:&#x2F;&#x2F;github.com&#x2F;helpisdev&#x2F;utilities_example.git) the utilities_example repository

2. Clone your forked repository

   ```bash
   git clone https://github.com/helpisdev/utilities_example.git
   ```

3. Go into the repository folder

   ```bash
   cd utilities_example
   ```

4. Add the original utilities_example repository as `upstream` to your forked repository

   ```bash
   git remote add upstream https:&#x2F;&#x2F;github.com&#x2F;helpisdev&#x2F;utilities_example.git
   ```

5. Activate `melos` globally:

   ```bash
   dart pub global activate melos
   ```

6. Install all Dart dependencies:

   ```bash
   melos run get
   melos run upgrade
   ```

### Test suite

The tests can be started via:

```bash
cd utilities_example
melos run test
melos run test:goldens # UI tests
melos run test:benchmark # Benchmark tests
melos run test:coverage # Coverage test
```

## Checklist before submitting a PR

> When pushing fixes to the PR comments, please push as separate commits; we will squash the PR before merging, so there is no need to squash it before pushing it, and we are more than okay with 10-100 commits in a single PR. This helps review the fixes to the requested changes.

## Contributor License Agreement

That we do not have any potential problems later it is sadly necessary to sign a [Contributor License Agreement](CONTRIBUTOR_LICENSE_AGREEMENT.md). That can be done literally with the push of a button.

A bot will automatically comment on the pull request once it got opened asking for the agreement to be signed. Before it did not get signed it is sadly not possible to merge it in.
