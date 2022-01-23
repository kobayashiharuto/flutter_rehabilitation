// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'task_edit_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TaskEditStateTearOff {
  const _$TaskEditStateTearOff();

  _TaskEditState call({bool? completed}) {
    return _TaskEditState(
      completed: completed,
    );
  }
}

/// @nodoc
const $TaskEditState = _$TaskEditStateTearOff();

/// @nodoc
mixin _$TaskEditState {
  bool? get completed => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TaskEditStateCopyWith<TaskEditState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskEditStateCopyWith<$Res> {
  factory $TaskEditStateCopyWith(
          TaskEditState value, $Res Function(TaskEditState) then) =
      _$TaskEditStateCopyWithImpl<$Res>;
  $Res call({bool? completed});
}

/// @nodoc
class _$TaskEditStateCopyWithImpl<$Res>
    implements $TaskEditStateCopyWith<$Res> {
  _$TaskEditStateCopyWithImpl(this._value, this._then);

  final TaskEditState _value;
  // ignore: unused_field
  final $Res Function(TaskEditState) _then;

  @override
  $Res call({
    Object? completed = freezed,
  }) {
    return _then(_value.copyWith(
      completed: completed == freezed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$TaskEditStateCopyWith<$Res>
    implements $TaskEditStateCopyWith<$Res> {
  factory _$TaskEditStateCopyWith(
          _TaskEditState value, $Res Function(_TaskEditState) then) =
      __$TaskEditStateCopyWithImpl<$Res>;
  @override
  $Res call({bool? completed});
}

/// @nodoc
class __$TaskEditStateCopyWithImpl<$Res>
    extends _$TaskEditStateCopyWithImpl<$Res>
    implements _$TaskEditStateCopyWith<$Res> {
  __$TaskEditStateCopyWithImpl(
      _TaskEditState _value, $Res Function(_TaskEditState) _then)
      : super(_value, (v) => _then(v as _TaskEditState));

  @override
  _TaskEditState get _value => super._value as _TaskEditState;

  @override
  $Res call({
    Object? completed = freezed,
  }) {
    return _then(_TaskEditState(
      completed: completed == freezed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$_TaskEditState implements _TaskEditState {
  const _$_TaskEditState({this.completed});

  @override
  final bool? completed;

  @override
  String toString() {
    return 'TaskEditState(completed: $completed)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TaskEditState &&
            const DeepCollectionEquality().equals(other.completed, completed));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(completed));

  @JsonKey(ignore: true)
  @override
  _$TaskEditStateCopyWith<_TaskEditState> get copyWith =>
      __$TaskEditStateCopyWithImpl<_TaskEditState>(this, _$identity);
}

abstract class _TaskEditState implements TaskEditState {
  const factory _TaskEditState({bool? completed}) = _$_TaskEditState;

  @override
  bool? get completed;
  @override
  @JsonKey(ignore: true)
  _$TaskEditStateCopyWith<_TaskEditState> get copyWith =>
      throw _privateConstructorUsedError;
}
