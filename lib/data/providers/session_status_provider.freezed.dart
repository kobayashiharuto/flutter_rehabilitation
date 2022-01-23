// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'session_status_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SessionStatusWrapperTearOff {
  const _$SessionStatusWrapperTearOff();

  _SessionStatusWrapper call({SessionStatus? sessionStatus}) {
    return _SessionStatusWrapper(
      sessionStatus: sessionStatus,
    );
  }
}

/// @nodoc
const $SessionStatusWrapper = _$SessionStatusWrapperTearOff();

/// @nodoc
mixin _$SessionStatusWrapper {
  SessionStatus? get sessionStatus => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SessionStatusWrapperCopyWith<SessionStatusWrapper> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SessionStatusWrapperCopyWith<$Res> {
  factory $SessionStatusWrapperCopyWith(SessionStatusWrapper value,
          $Res Function(SessionStatusWrapper) then) =
      _$SessionStatusWrapperCopyWithImpl<$Res>;
  $Res call({SessionStatus? sessionStatus});
}

/// @nodoc
class _$SessionStatusWrapperCopyWithImpl<$Res>
    implements $SessionStatusWrapperCopyWith<$Res> {
  _$SessionStatusWrapperCopyWithImpl(this._value, this._then);

  final SessionStatusWrapper _value;
  // ignore: unused_field
  final $Res Function(SessionStatusWrapper) _then;

  @override
  $Res call({
    Object? sessionStatus = freezed,
  }) {
    return _then(_value.copyWith(
      sessionStatus: sessionStatus == freezed
          ? _value.sessionStatus
          : sessionStatus // ignore: cast_nullable_to_non_nullable
              as SessionStatus?,
    ));
  }
}

/// @nodoc
abstract class _$SessionStatusWrapperCopyWith<$Res>
    implements $SessionStatusWrapperCopyWith<$Res> {
  factory _$SessionStatusWrapperCopyWith(_SessionStatusWrapper value,
          $Res Function(_SessionStatusWrapper) then) =
      __$SessionStatusWrapperCopyWithImpl<$Res>;
  @override
  $Res call({SessionStatus? sessionStatus});
}

/// @nodoc
class __$SessionStatusWrapperCopyWithImpl<$Res>
    extends _$SessionStatusWrapperCopyWithImpl<$Res>
    implements _$SessionStatusWrapperCopyWith<$Res> {
  __$SessionStatusWrapperCopyWithImpl(
      _SessionStatusWrapper _value, $Res Function(_SessionStatusWrapper) _then)
      : super(_value, (v) => _then(v as _SessionStatusWrapper));

  @override
  _SessionStatusWrapper get _value => super._value as _SessionStatusWrapper;

  @override
  $Res call({
    Object? sessionStatus = freezed,
  }) {
    return _then(_SessionStatusWrapper(
      sessionStatus: sessionStatus == freezed
          ? _value.sessionStatus
          : sessionStatus // ignore: cast_nullable_to_non_nullable
              as SessionStatus?,
    ));
  }
}

/// @nodoc

class _$_SessionStatusWrapper implements _SessionStatusWrapper {
  const _$_SessionStatusWrapper({this.sessionStatus});

  @override
  final SessionStatus? sessionStatus;

  @override
  String toString() {
    return 'SessionStatusWrapper(sessionStatus: $sessionStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SessionStatusWrapper &&
            const DeepCollectionEquality()
                .equals(other.sessionStatus, sessionStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(sessionStatus));

  @JsonKey(ignore: true)
  @override
  _$SessionStatusWrapperCopyWith<_SessionStatusWrapper> get copyWith =>
      __$SessionStatusWrapperCopyWithImpl<_SessionStatusWrapper>(
          this, _$identity);
}

abstract class _SessionStatusWrapper implements SessionStatusWrapper {
  const factory _SessionStatusWrapper({SessionStatus? sessionStatus}) =
      _$_SessionStatusWrapper;

  @override
  SessionStatus? get sessionStatus;
  @override
  @JsonKey(ignore: true)
  _$SessionStatusWrapperCopyWith<_SessionStatusWrapper> get copyWith =>
      throw _privateConstructorUsedError;
}
