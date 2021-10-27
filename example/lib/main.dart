import 'package:flurry/flurry.dart';
import 'package:flutter/material.dart';
import 'dart:async';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    await Flurry.initialize(
        androidKey: "VTJK9PMKPZB8WTS4DBK2",
        iosKey: "2GS6227JS2R3XQC375VX",
        enableLog: true);
    await Flurry.setUserId("userId");
    await Flurry.logEvent("eventName");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('A Flurry plugin example app'),
        ),
        body: Center(
          child: Text(
              'Should log event. Please close the app and wait a few seconds for events to be sent.'),
        ),
      ),
    );
  }
}
