import 'package:flutter/foundation.dart';
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
