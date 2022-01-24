// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'task_create_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$TaskCreateViewStateTearOff {
  const _$TaskCreateViewStateTearOff();

  _TaskCreateViewState call({String title = '', String description = ''}) {
    return _TaskCreateViewState(
      title: title,
      description: description,
    );
  }
}

/// @nodoc
const $TaskCreateViewState = _$TaskCreateViewStateTearOff();

/// @nodoc
mixin _$TaskCreateViewState {
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TaskCreateViewStateCopyWith<TaskCreateViewState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TaskCreateViewStateCopyWith<$Res> {
  factory $TaskCreateViewStateCopyWith(
          TaskCreateViewState value, $Res Function(TaskCreateViewState) then) =
      _$TaskCreateViewStateCopyWithImpl<$Res>;
  $Res call({String title, String description});
}

/// @nodoc
class _$TaskCreateViewStateCopyWithImpl<$Res>
    implements $TaskCreateViewStateCopyWith<$Res> {
  _$TaskCreateViewStateCopyWithImpl(this._value, this._then);

  final TaskCreateViewState _value;
  // ignore: unused_field
  final $Res Function(TaskCreateViewState) _then;

  @override
  $Res call({
    Object? title = freezed,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$TaskCreateViewStateCopyWith<$Res>
    implements $TaskCreateViewStateCopyWith<$Res> {
  factory _$TaskCreateViewStateCopyWith(_TaskCreateViewState value,
          $Res Function(_TaskCreateViewState) then) =
      __$TaskCreateViewStateCopyWithImpl<$Res>;
  @override
  $Res call({String title, String description});
}

/// @nodoc
class __$TaskCreateViewStateCopyWithImpl<$Res>
    extends _$TaskCreateViewStateCopyWithImpl<$Res>
    implements _$TaskCreateViewStateCopyWith<$Res> {
  __$TaskCreateViewStateCopyWithImpl(
      _TaskCreateViewState _value, $Res Function(_TaskCreateViewState) _then)
      : super(_value, (v) => _then(v as _TaskCreateViewState));

  @override
  _TaskCreateViewState get _value => super._value as _TaskCreateViewState;

  @override
  $Res call({
    Object? title = freezed,
    Object? description = freezed,
  }) {
    return _then(_TaskCreateViewState(
      title: title == freezed
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: description == freezed
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_TaskCreateViewState implements _TaskCreateViewState {
  const _$_TaskCreateViewState({this.title = '', this.description = ''});

  @JsonKey()
  @override
  final String title;
  @JsonKey()
  @override
  final String description;

  @override
  String toString() {
    return 'TaskCreateViewState(title: $title, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TaskCreateViewState &&
            const DeepCollectionEquality().equals(other.title, title) &&
            const DeepCollectionEquality()
                .equals(other.description, description));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(title),
      const DeepCollectionEquality().hash(description));

  @JsonKey(ignore: true)
  @override
  _$TaskCreateViewStateCopyWith<_TaskCreateViewState> get copyWith =>
      __$TaskCreateViewStateCopyWithImpl<_TaskCreateViewState>(
          this, _$identity);
}

abstract class _TaskCreateViewState implements TaskCreateViewState {
  const factory _TaskCreateViewState({String title, String description}) =
      _$_TaskCreateViewState;

  @override
  String get title;
  @override
  String get description;
  @override
  @JsonKey(ignore: true)
  _$TaskCreateViewStateCopyWith<_TaskCreateViewState> get copyWith =>
      throw _privateConstructorUsedError;
}
