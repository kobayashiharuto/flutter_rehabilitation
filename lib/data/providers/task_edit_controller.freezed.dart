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
class _$TaskEditViewStateTearOff {
  const _$TaskEditViewStateTearOff();

  _TaskEditViewState call(
      {required bool completed, required DateTime dateTime}) {
    return _TaskEditViewState(
      completed: completed,
      dateTime: dateTime,
    );
  }
}

/// @nodoc
const $TaskEditViewState = _$TaskEditViewStateTearOff();

/// @nodoc
mixin _$TaskEditViewState {
  bool get completed => throw _privateConstructorUsedError;
  DateTime get dateTime => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TaskEditViewStateCopyWith<TaskEditViewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskEditViewStateCopyWith<$Res> {
  factory $TaskEditViewStateCopyWith(
          TaskEditViewState value, $Res Function(TaskEditViewState) then) =
      _$TaskEditViewStateCopyWithImpl<$Res>;
  $Res call({bool completed, DateTime dateTime});
}

/// @nodoc
class _$TaskEditViewStateCopyWithImpl<$Res>
    implements $TaskEditViewStateCopyWith<$Res> {
  _$TaskEditViewStateCopyWithImpl(this._value, this._then);

  final TaskEditViewState _value;
  // ignore: unused_field
  final $Res Function(TaskEditViewState) _then;

  @override
  $Res call({
    Object? completed = freezed,
    Object? dateTime = freezed,
  }) {
    return _then(_value.copyWith(
      completed: completed == freezed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool,
      dateTime: dateTime == freezed
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
abstract class _$TaskEditViewStateCopyWith<$Res>
    implements $TaskEditViewStateCopyWith<$Res> {
  factory _$TaskEditViewStateCopyWith(
          _TaskEditViewState value, $Res Function(_TaskEditViewState) then) =
      __$TaskEditViewStateCopyWithImpl<$Res>;
  @override
  $Res call({bool completed, DateTime dateTime});
}

/// @nodoc
class __$TaskEditViewStateCopyWithImpl<$Res>
    extends _$TaskEditViewStateCopyWithImpl<$Res>
    implements _$TaskEditViewStateCopyWith<$Res> {
  __$TaskEditViewStateCopyWithImpl(
      _TaskEditViewState _value, $Res Function(_TaskEditViewState) _then)
      : super(_value, (v) => _then(v as _TaskEditViewState));

  @override
  _TaskEditViewState get _value => super._value as _TaskEditViewState;

  @override
  $Res call({
    Object? completed = freezed,
    Object? dateTime = freezed,
  }) {
    return _then(_TaskEditViewState(
      completed: completed == freezed
          ? _value.completed
          : completed // ignore: cast_nullable_to_non_nullable
              as bool,
      dateTime: dateTime == freezed
          ? _value.dateTime
          : dateTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$_TaskEditViewState implements _TaskEditViewState {
  const _$_TaskEditViewState({required this.completed, required this.dateTime});

  @override
  final bool completed;
  @override
  final DateTime dateTime;

  @override
  String toString() {
    return 'TaskEditViewState(completed: $completed, dateTime: $dateTime)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TaskEditViewState &&
            const DeepCollectionEquality().equals(other.completed, completed) &&
            const DeepCollectionEquality().equals(other.dateTime, dateTime));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(completed),
      const DeepCollectionEquality().hash(dateTime));

  @JsonKey(ignore: true)
  @override
  _$TaskEditViewStateCopyWith<_TaskEditViewState> get copyWith =>
      __$TaskEditViewStateCopyWithImpl<_TaskEditViewState>(this, _$identity);
}

abstract class _TaskEditViewState implements TaskEditViewState {
  const factory _TaskEditViewState(
      {required bool completed,
      required DateTime dateTime}) = _$_TaskEditViewState;

  @override
  bool get completed;
  @override
  DateTime get dateTime;
  @override
  @JsonKey(ignore: true)
  _$TaskEditViewStateCopyWith<_TaskEditViewState> get copyWith =>
      throw _privateConstructorUsedError;
}
