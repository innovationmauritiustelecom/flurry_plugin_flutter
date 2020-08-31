import 'dart:async';

import 'package:flutter/services.dart';

class FlurryEvent {
  static const MethodChannel _channel = const MethodChannel('flurry');

  static Future<String> get platformVersion async {
    final String version = await _channel.invokeMethod('getPlatformVersion');
    return version;
  }

  static Future<Null> initialize(
      {

      /// flurry androidKey
      String androidKey = "",

      /// flurry iosKey
      String iosKey = "",

      /// enable log flag
      bool enableLog = true}) async {
    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent("api_key_android", () => androidKey);
    args.putIfAbsent("api_key_ios", () => iosKey);
    args.putIfAbsent("is_log_enabled", () => enableLog);

    await _channel.invokeMethod('initialize', args);

    return null;
  }

  static Future<Null> logEvent(
    /// event name
    String message, {

    /// witn event params
    Map<String, String> params = const <String, String>{},
  }) async {
    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent("message", () => message);
    args.putIfAbsent("params", () => params);

    await _channel.invokeMethod('logEvent', args);
    return null;
  }

  static Future<Null> setUserId(

      /// userId
      String userId) async {
    Map<String, dynamic> args = <String, dynamic>{};
    args.putIfAbsent("userId", () => userId);

    await _channel.invokeMethod('userId', args);
    return null;
  }
}
