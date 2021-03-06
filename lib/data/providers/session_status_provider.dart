import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:test_interval/utils/extensions/state_notifier_log.dart';

part 'session_status_provider.freezed.dart';

enum SessionStatus { login, logout }

// ステート
@freezed
class SessionStatusWrapper with _$SessionStatusWrapper {
  const factory SessionStatusWrapper({
    SessionStatus? sessionStatus,
    String? uid,
  }) = _SessionStatusWrapper;
}

// コントローラー
final sessionStatusProvider =
    StateNotifierProvider<SessionStatusProvider, SessionStatusWrapper>(
        (_) => SessionStatusProvider());

class SessionStatusProvider extends StateNotifierWithLog<SessionStatusWrapper> {
  SessionStatusProvider() : super(const SessionStatusWrapper()) {
    listen();
  }

  void listen() {
    FirebaseAuth.instance.authStateChanges().listen(
      (user) {
        if (user == null) {
          state =
              state.copyWith(sessionStatus: SessionStatus.logout, uid: null);
          return;
        }
        state =
            state.copyWith(sessionStatus: SessionStatus.login, uid: user.uid);
      },
    );
  }
}
