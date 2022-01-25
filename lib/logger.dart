import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:logging/logging.dart';

// StateNotifier関連のログ
final stateNotifierLog = Logger('stateNotifier');

// モデル層のログ
final modelLog = Logger('model');

void logSetting() {
  Logger.root.level = Level.OFF;
  Logger.root.onRecord.listen((LogRecord rec) {
    debugPrint('${rec.level.name}: ${rec.time}: ${rec.message}');
  });
  hierarchicalLoggingEnabled = true;

  stateNotifierLog.level = Level.ALL;
  modelLog.level = Level.ALL;
}

// ignore: unused_element
class ProviderDebugLogger extends ProviderObserver {
  @override
  void didUpdateProvider(ProviderBase<dynamic> provider, Object? previousValue,
      Object? newValue, ProviderContainer container) {
    debugPrint('''
  ---------------------------------Provider Log Start-------------------------------
  "provider": "${provider.name ?? provider.runtimeType}",
  "previousValue": "$previousValue"
  "newValue": "$newValue"
  ---------------------------------Provider Log End---------------------------------
''');
  }
}
