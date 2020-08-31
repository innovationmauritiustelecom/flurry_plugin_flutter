# flurry_event

fork from [flurry](https://github.com/innovationmauritiustelecom/flurry_plugin_flutter) add logEvent params.

## Getting Started

This is a Flutter plugin to use Flurry Analytics. It implements native calls to [Flurry Android SDK][flurry_sdk_android] and [Flurry iOS SDK][flurry_sdk_ios]. The plugin logs sessions, crash detections, simple event logging, and UserId.

## Installation

Add flurry_event: ^0.1.3 in your pubspec.yaml dependencies.

## How to use

importing the library:

``` dart
import 'package:flurry_event/flurry.dart';
```

initialization:

``` dart
await FlurryEvent.initialize(
  androidKey: "xxx",
  iosKey: "xxx",
  enableLog: true,
  );
```

logging/setting userId:

``` dart
FlurryEvent.setUserId("1234");
```

logging event:

``` dart
FlurryEvent.logEvent("event name", {
    'foo': 'bar',
  },
);
```

[flurry_sdk_android]: https://developer.yahoo.com/flurry/docs/integrateflurry/android
[flurry_sdk_ios]: https://developer.yahoo.com/flurry/docs/integrateflurry/ios

[![Paypal](https://www.paypalobjects.com/webstatic/mktg/Logo/pp-logo-100px.png)](https://paypal.me/paydomliang)

<a href="https://www.buymeacoffee.com/domliang" target="_blank"><img src="https://www.buymeacoffee.com/assets/img/custom_images/purple_img.png" alt="Buy Me A Coffee" style="height: auto !important;width: auto !important;" ></a>
