import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test_interval/utils/tools/logger.dart';

class StateNotifierWithLog<T> extends StateNotifier<T> {
  StateNotifierWithLog(T state, {this.info}) : super(state) {
    stateNotifierLog.info('👀GENERATE: ${runtimeType.toString()}'
        '${info != null ? '\nINFO: $info' : ''}');
  }

  final String? info;

  @override
  void dispose() {
    super.dispose();
    stateNotifierLog.info('👋DISPOSE: ${runtimeType.toString()}'
        '${info != null ? '\nINFO: $info' : ''}');
  }
}
