#meta-android-example

This is an example on how to integrate the frontend-library into an app.

It was build using Android Studio.

## Dependencies
This project depends on the [meta-frontend](https://github.com/moddx/meta-frontend) library.

## How to use
1. Clone `git clone https://github.com/moddx/meta-android-example`
2. Fetch the submodules

        git submodule update --init --recursive

3. Open the  project with Android Studio or similar.
4. To actually test the app you should have the [meta service plattform](https://github.com/moddx/meta-plattform) up and running, as well as a deployed ComputeUnit. You can change the host and apikey in the file `app/src/main/cpp/native-lib.cpp`.
