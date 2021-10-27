# flurry

A Flutter plugin to use Flurry Analytics. This plugin logs sessions, crash detections, simple event logging, UserId.

## Getting Started

This is a Flutter plugin to use Flurry Analytics. It implements native calls to [Flurry Android SDK][flurry_sdk_android] and [Flurry iOS SDK][flurry_sdk_ios]. The plugin logs sessions, crash detections, simple event logging, and UserId.

## Installation

Add flurry: ^1.0.0 in your pubspec.yaml dependencies.

## How to use

importing the library:

```dart
import 'package:flurry/flurry.dart';
```

initialization:

```dart
await Flurry.initialize(androidKey: "xxx", iosKey: "xxx", enableLog: true);
```

logging/setting userId:

```dart
Flurry.setUserId("1234");
```

logging event:

```dart
Flurry.logEvent("event name");
```

[flurry_sdk_android]: https://developer.yahoo.com/flurry/docs/integrateflurry/android
[flurry_sdk_ios]: https://developer.yahoo.com/flurry/docs/integrateflurry/ios
