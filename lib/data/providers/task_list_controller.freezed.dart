// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'task_list_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TaskListViewStateTearOff {
  const _$TaskListViewStateTearOff();

  _TaskListViewState call(
      {bool onScreenLoading = true, List<Task> tasks = const <Task>[]}) {
    return _TaskListViewState(
      onScreenLoading: onScreenLoading,
      tasks: tasks,
    );
  }
}

/// @nodoc
const $TaskListViewState = _$TaskListViewStateTearOff();

/// @nodoc
mixin _$TaskListViewState {
  bool get onScreenLoading => throw _privateConstructorUsedError;
  List<Task> get tasks => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TaskListViewStateCopyWith<TaskListViewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskListViewStateCopyWith<$Res> {
  factory $TaskListViewStateCopyWith(
          TaskListViewState value, $Res Function(TaskListViewState) then) =
      _$TaskListViewStateCopyWithImpl<$Res>;
  $Res call({bool onScreenLoading, List<Task> tasks});
}

/// @nodoc
class _$TaskListViewStateCopyWithImpl<$Res>
    implements $TaskListViewStateCopyWith<$Res> {
  _$TaskListViewStateCopyWithImpl(this._value, this._then);

  final TaskListViewState _value;
  // ignore: unused_field
  final $Res Function(TaskListViewState) _then;

  @override
  $Res call({
    Object? onScreenLoading = freezed,
    Object? tasks = freezed,
  }) {
    return _then(_value.copyWith(
      onScreenLoading: onScreenLoading == freezed
          ? _value.onScreenLoading
          : onScreenLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      tasks: tasks == freezed
          ? _value.tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<Task>,
    ));
  }
}

/// @nodoc
abstract class _$TaskListViewStateCopyWith<$Res>
    implements $TaskListViewStateCopyWith<$Res> {
  factory _$TaskListViewStateCopyWith(
          _TaskListViewState value, $Res Function(_TaskListViewState) then) =
      __$TaskListViewStateCopyWithImpl<$Res>;
  @override
  $Res call({bool onScreenLoading, List<Task> tasks});
}

/// @nodoc
class __$TaskListViewStateCopyWithImpl<$Res>
    extends _$TaskListViewStateCopyWithImpl<$Res>
    implements _$TaskListViewStateCopyWith<$Res> {
  __$TaskListViewStateCopyWithImpl(
      _TaskListViewState _value, $Res Function(_TaskListViewState) _then)
      : super(_value, (v) => _then(v as _TaskListViewState));

  @override
  _TaskListViewState get _value => super._value as _TaskListViewState;

  @override
  $Res call({
    Object? onScreenLoading = freezed,
    Object? tasks = freezed,
  }) {
    return _then(_TaskListViewState(
      onScreenLoading: onScreenLoading == freezed
          ? _value.onScreenLoading
          : onScreenLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      tasks: tasks == freezed
          ? _value.tasks
          : tasks // ignore: cast_nullable_to_non_nullable
              as List<Task>,
    ));
  }
}

/// @nodoc

class _$_TaskListViewState implements _TaskListViewState {
  const _$_TaskListViewState(
      {this.onScreenLoading = true, this.tasks = const <Task>[]});

  @JsonKey()
  @override
  final bool onScreenLoading;
  @JsonKey()
  @override
  final List<Task> tasks;

  @override
  String toString() {
    return 'TaskListViewState(onScreenLoading: $onScreenLoading, tasks: $tasks)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TaskListViewState &&
            const DeepCollectionEquality()
                .equals(other.onScreenLoading, onScreenLoading) &&
            const DeepCollectionEquality().equals(other.tasks, tasks));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(onScreenLoading),
      const DeepCollectionEquality().hash(tasks));

  @JsonKey(ignore: true)
  @override
  _$TaskListViewStateCopyWith<_TaskListViewState> get copyWith =>
      __$TaskListViewStateCopyWithImpl<_TaskListViewState>(this, _$identity);
}

abstract class _TaskListViewState implements TaskListViewState {
  const factory _TaskListViewState({bool onScreenLoading, List<Task> tasks}) =
      _$_TaskListViewState;

  @override
  bool get onScreenLoading;
  @override
  List<Task> get tasks;
  @override
  @JsonKey(ignore: true)
  _$TaskListViewStateCopyWith<_TaskListViewState> get copyWith =>
      throw _privateConstructorUsedError;
}
