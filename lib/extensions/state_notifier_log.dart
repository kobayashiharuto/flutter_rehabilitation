import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class StateNotifierWithLog<T> extends StateNotifier<T> {
  StateNotifierWithLog(T state, {this.info}) : super(state) {
    debugPrint('\n次の StateNotifier が生成されました: ${runtimeType.toString()}'
        '${info != null ? '\nINFO: $info' : '\n'}');
  }

  final String? info;

  @override
  void dispose() {
    super.dispose();
    debugPrint('\n次の StateNotifier が削除されました: ${runtimeType.toString()}'
        '${info != null ? '\nINFO: $info' : '\n'}');
  }
}
