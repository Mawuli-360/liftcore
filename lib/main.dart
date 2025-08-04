import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:liftcore/src/core/app_configurations/app_init.dart';
import 'package:liftcore/main_app.dart';

void main() async {
  await AppInit.init();

  runApp(ProviderScope(child: MainApp()));
}
