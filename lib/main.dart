import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test_interval/router/router.dart';
import 'package:test_interval/utils/tools/logger.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  logSetting();

  runApp(ProviderScope(
    overrides: const [],
    observers: [ProviderDebugLogger()],
    child: MyApp(),
  ));
}
