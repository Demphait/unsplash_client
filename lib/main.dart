import 'package:core/di/locator.dart';
import 'package:flutter/material.dart';
import 'package:presentation/application.dart';
import 'package:unsplash_client/di/injector.config.dart';

Future<void> main() async {
  await locator.init();

  runApp(const Application());
}
