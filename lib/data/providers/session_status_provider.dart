import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test_interval/data/entities/task.dart';
import 'package:test_interval/data/repositories/tasks_repository.dart';

part 'session_status_provider.freezed.dart';

enum SessionStatus { login, logout }

// ステート
@freezed
class SessionStatusWrapper with _$SessionStatusWrapper {
  const factory SessionStatusWrapper({SessionStatus? sessionStatus}) =
      _SessionStatusWrapper;
}

// コントローラー
final sessionStatusProvider = StateNotifierProvider.autoDispose<
    SessionStatusProvider,
    SessionStatusWrapper>((_) => SessionStatusProvider());

class SessionStatusProvider extends StateNotifier<SessionStatusWrapper> {
  SessionStatusProvider() : super(const SessionStatusWrapper()) {
    listen();
  }

  void listen() {
    FirebaseAuth.instance.authStateChanges().listen(
      (status) {
        if (status == null) {
          state = state.copyWith(sessionStatus: SessionStatus.logout);
          return;
        }
        state = state.copyWith(sessionStatus: SessionStatus.login);
      },
    );
  }
}
