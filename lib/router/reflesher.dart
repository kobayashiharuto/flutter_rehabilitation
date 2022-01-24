import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test_interval/data/providers/session_status_provider.dart';

final refreshListenableProvider = Provider(
  (ref) => Listenable.merge(
    [
      ValueNotifier(
          ref.watch<SessionStatusWrapper>(sessionStatusProvider)),
    ],
  ),
);
