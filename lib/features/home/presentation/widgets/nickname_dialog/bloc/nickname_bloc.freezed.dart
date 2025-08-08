// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nickname_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$NicknameEvent {
  String get nickname => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String nickname) onNicknameChanged,
    required TResult Function(String nickname) onSaveNickname,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String nickname)? onNicknameChanged,
    TResult? Function(String nickname)? onSaveNickname,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String nickname)? onNicknameChanged,
    TResult Function(String nickname)? onSaveNickname,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NicknameEventOnNicknameChanged value)
    onNicknameChanged,
    required TResult Function(NicknameEventOnSaveNickname value) onSaveNickname,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NicknameEventOnNicknameChanged value)? onNicknameChanged,
    TResult? Function(NicknameEventOnSaveNickname value)? onSaveNickname,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NicknameEventOnNicknameChanged value)? onNicknameChanged,
    TResult Function(NicknameEventOnSaveNickname value)? onSaveNickname,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Create a copy of NicknameEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NicknameEventCopyWith<NicknameEvent> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NicknameEventCopyWith<$Res> {
  factory $NicknameEventCopyWith(
    NicknameEvent value,
    $Res Function(NicknameEvent) then,
  ) = _$NicknameEventCopyWithImpl<$Res, NicknameEvent>;
  @useResult
  $Res call({String nickname});
}

/// @nodoc
class _$NicknameEventCopyWithImpl<$Res, $Val extends NicknameEvent>
    implements $NicknameEventCopyWith<$Res> {
  _$NicknameEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NicknameEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? nickname = null}) {
    return _then(
      _value.copyWith(
            nickname: null == nickname
                ? _value.nickname
                : nickname // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$NicknameEventOnNicknameChangedImplCopyWith<$Res>
    implements $NicknameEventCopyWith<$Res> {
  factory _$$NicknameEventOnNicknameChangedImplCopyWith(
    _$NicknameEventOnNicknameChangedImpl value,
    $Res Function(_$NicknameEventOnNicknameChangedImpl) then,
  ) = __$$NicknameEventOnNicknameChangedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String nickname});
}

/// @nodoc
class __$$NicknameEventOnNicknameChangedImplCopyWithImpl<$Res>
    extends
        _$NicknameEventCopyWithImpl<$Res, _$NicknameEventOnNicknameChangedImpl>
    implements _$$NicknameEventOnNicknameChangedImplCopyWith<$Res> {
  __$$NicknameEventOnNicknameChangedImplCopyWithImpl(
    _$NicknameEventOnNicknameChangedImpl _value,
    $Res Function(_$NicknameEventOnNicknameChangedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NicknameEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? nickname = null}) {
    return _then(
      _$NicknameEventOnNicknameChangedImpl(
        nickname: null == nickname
            ? _value.nickname
            : nickname // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$NicknameEventOnNicknameChangedImpl
    implements NicknameEventOnNicknameChanged {
  const _$NicknameEventOnNicknameChangedImpl({required this.nickname});

  @override
  final String nickname;

  @override
  String toString() {
    return 'NicknameEvent.onNicknameChanged(nickname: $nickname)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NicknameEventOnNicknameChangedImpl &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname));
  }

  @override
  int get hashCode => Object.hash(runtimeType, nickname);

  /// Create a copy of NicknameEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NicknameEventOnNicknameChangedImplCopyWith<
    _$NicknameEventOnNicknameChangedImpl
  >
  get copyWith =>
      __$$NicknameEventOnNicknameChangedImplCopyWithImpl<
        _$NicknameEventOnNicknameChangedImpl
      >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String nickname) onNicknameChanged,
    required TResult Function(String nickname) onSaveNickname,
  }) {
    return onNicknameChanged(nickname);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String nickname)? onNicknameChanged,
    TResult? Function(String nickname)? onSaveNickname,
  }) {
    return onNicknameChanged?.call(nickname);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String nickname)? onNicknameChanged,
    TResult Function(String nickname)? onSaveNickname,
    required TResult orElse(),
  }) {
    if (onNicknameChanged != null) {
      return onNicknameChanged(nickname);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NicknameEventOnNicknameChanged value)
    onNicknameChanged,
    required TResult Function(NicknameEventOnSaveNickname value) onSaveNickname,
  }) {
    return onNicknameChanged(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NicknameEventOnNicknameChanged value)? onNicknameChanged,
    TResult? Function(NicknameEventOnSaveNickname value)? onSaveNickname,
  }) {
    return onNicknameChanged?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NicknameEventOnNicknameChanged value)? onNicknameChanged,
    TResult Function(NicknameEventOnSaveNickname value)? onSaveNickname,
    required TResult orElse(),
  }) {
    if (onNicknameChanged != null) {
      return onNicknameChanged(this);
    }
    return orElse();
  }
}

abstract class NicknameEventOnNicknameChanged implements NicknameEvent {
  const factory NicknameEventOnNicknameChanged({
    required final String nickname,
  }) = _$NicknameEventOnNicknameChangedImpl;

  @override
  String get nickname;

  /// Create a copy of NicknameEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NicknameEventOnNicknameChangedImplCopyWith<
    _$NicknameEventOnNicknameChangedImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NicknameEventOnSaveNicknameImplCopyWith<$Res>
    implements $NicknameEventCopyWith<$Res> {
  factory _$$NicknameEventOnSaveNicknameImplCopyWith(
    _$NicknameEventOnSaveNicknameImpl value,
    $Res Function(_$NicknameEventOnSaveNicknameImpl) then,
  ) = __$$NicknameEventOnSaveNicknameImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String nickname});
}

/// @nodoc
class __$$NicknameEventOnSaveNicknameImplCopyWithImpl<$Res>
    extends _$NicknameEventCopyWithImpl<$Res, _$NicknameEventOnSaveNicknameImpl>
    implements _$$NicknameEventOnSaveNicknameImplCopyWith<$Res> {
  __$$NicknameEventOnSaveNicknameImplCopyWithImpl(
    _$NicknameEventOnSaveNicknameImpl _value,
    $Res Function(_$NicknameEventOnSaveNicknameImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NicknameEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? nickname = null}) {
    return _then(
      _$NicknameEventOnSaveNicknameImpl(
        nickname: null == nickname
            ? _value.nickname
            : nickname // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$NicknameEventOnSaveNicknameImpl implements NicknameEventOnSaveNickname {
  const _$NicknameEventOnSaveNicknameImpl({required this.nickname});

  @override
  final String nickname;

  @override
  String toString() {
    return 'NicknameEvent.onSaveNickname(nickname: $nickname)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NicknameEventOnSaveNicknameImpl &&
            (identical(other.nickname, nickname) ||
                other.nickname == nickname));
  }

  @override
  int get hashCode => Object.hash(runtimeType, nickname);

  /// Create a copy of NicknameEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NicknameEventOnSaveNicknameImplCopyWith<_$NicknameEventOnSaveNicknameImpl>
  get copyWith =>
      __$$NicknameEventOnSaveNicknameImplCopyWithImpl<
        _$NicknameEventOnSaveNicknameImpl
      >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String nickname) onNicknameChanged,
    required TResult Function(String nickname) onSaveNickname,
  }) {
    return onSaveNickname(nickname);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String nickname)? onNicknameChanged,
    TResult? Function(String nickname)? onSaveNickname,
  }) {
    return onSaveNickname?.call(nickname);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String nickname)? onNicknameChanged,
    TResult Function(String nickname)? onSaveNickname,
    required TResult orElse(),
  }) {
    if (onSaveNickname != null) {
      return onSaveNickname(nickname);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NicknameEventOnNicknameChanged value)
    onNicknameChanged,
    required TResult Function(NicknameEventOnSaveNickname value) onSaveNickname,
  }) {
    return onSaveNickname(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NicknameEventOnNicknameChanged value)? onNicknameChanged,
    TResult? Function(NicknameEventOnSaveNickname value)? onSaveNickname,
  }) {
    return onSaveNickname?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NicknameEventOnNicknameChanged value)? onNicknameChanged,
    TResult Function(NicknameEventOnSaveNickname value)? onSaveNickname,
    required TResult orElse(),
  }) {
    if (onSaveNickname != null) {
      return onSaveNickname(this);
    }
    return orElse();
  }
}

abstract class NicknameEventOnSaveNickname implements NicknameEvent {
  const factory NicknameEventOnSaveNickname({required final String nickname}) =
      _$NicknameEventOnSaveNicknameImpl;

  @override
  String get nickname;

  /// Create a copy of NicknameEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NicknameEventOnSaveNicknameImplCopyWith<_$NicknameEventOnSaveNicknameImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$NicknameState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() nicknameSaved,
    required TResult Function(String message) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? nicknameSaved,
    TResult? Function(String message)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? nicknameSaved,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NicknameStateInitial value) initial,
    required TResult Function(NicknameStateNicknameSaved value) nicknameSaved,
    required TResult Function(NicknameStateError value) error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NicknameStateInitial value)? initial,
    TResult? Function(NicknameStateNicknameSaved value)? nicknameSaved,
    TResult? Function(NicknameStateError value)? error,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NicknameStateInitial value)? initial,
    TResult Function(NicknameStateNicknameSaved value)? nicknameSaved,
    TResult Function(NicknameStateError value)? error,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NicknameStateCopyWith<$Res> {
  factory $NicknameStateCopyWith(
    NicknameState value,
    $Res Function(NicknameState) then,
  ) = _$NicknameStateCopyWithImpl<$Res, NicknameState>;
}

/// @nodoc
class _$NicknameStateCopyWithImpl<$Res, $Val extends NicknameState>
    implements $NicknameStateCopyWith<$Res> {
  _$NicknameStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NicknameState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$NicknameStateInitialImplCopyWith<$Res> {
  factory _$$NicknameStateInitialImplCopyWith(
    _$NicknameStateInitialImpl value,
    $Res Function(_$NicknameStateInitialImpl) then,
  ) = __$$NicknameStateInitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NicknameStateInitialImplCopyWithImpl<$Res>
    extends _$NicknameStateCopyWithImpl<$Res, _$NicknameStateInitialImpl>
    implements _$$NicknameStateInitialImplCopyWith<$Res> {
  __$$NicknameStateInitialImplCopyWithImpl(
    _$NicknameStateInitialImpl _value,
    $Res Function(_$NicknameStateInitialImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NicknameState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$NicknameStateInitialImpl implements NicknameStateInitial {
  const _$NicknameStateInitialImpl();

  @override
  String toString() {
    return 'NicknameState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NicknameStateInitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() nicknameSaved,
    required TResult Function(String message) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? nicknameSaved,
    TResult? Function(String message)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? nicknameSaved,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NicknameStateInitial value) initial,
    required TResult Function(NicknameStateNicknameSaved value) nicknameSaved,
    required TResult Function(NicknameStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NicknameStateInitial value)? initial,
    TResult? Function(NicknameStateNicknameSaved value)? nicknameSaved,
    TResult? Function(NicknameStateError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NicknameStateInitial value)? initial,
    TResult Function(NicknameStateNicknameSaved value)? nicknameSaved,
    TResult Function(NicknameStateError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class NicknameStateInitial implements NicknameState {
  const factory NicknameStateInitial() = _$NicknameStateInitialImpl;
}

/// @nodoc
abstract class _$$NicknameStateNicknameSavedImplCopyWith<$Res> {
  factory _$$NicknameStateNicknameSavedImplCopyWith(
    _$NicknameStateNicknameSavedImpl value,
    $Res Function(_$NicknameStateNicknameSavedImpl) then,
  ) = __$$NicknameStateNicknameSavedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NicknameStateNicknameSavedImplCopyWithImpl<$Res>
    extends _$NicknameStateCopyWithImpl<$Res, _$NicknameStateNicknameSavedImpl>
    implements _$$NicknameStateNicknameSavedImplCopyWith<$Res> {
  __$$NicknameStateNicknameSavedImplCopyWithImpl(
    _$NicknameStateNicknameSavedImpl _value,
    $Res Function(_$NicknameStateNicknameSavedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NicknameState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$NicknameStateNicknameSavedImpl implements NicknameStateNicknameSaved {
  const _$NicknameStateNicknameSavedImpl();

  @override
  String toString() {
    return 'NicknameState.nicknameSaved()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NicknameStateNicknameSavedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() nicknameSaved,
    required TResult Function(String message) error,
  }) {
    return nicknameSaved();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? nicknameSaved,
    TResult? Function(String message)? error,
  }) {
    return nicknameSaved?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? nicknameSaved,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (nicknameSaved != null) {
      return nicknameSaved();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NicknameStateInitial value) initial,
    required TResult Function(NicknameStateNicknameSaved value) nicknameSaved,
    required TResult Function(NicknameStateError value) error,
  }) {
    return nicknameSaved(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NicknameStateInitial value)? initial,
    TResult? Function(NicknameStateNicknameSaved value)? nicknameSaved,
    TResult? Function(NicknameStateError value)? error,
  }) {
    return nicknameSaved?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NicknameStateInitial value)? initial,
    TResult Function(NicknameStateNicknameSaved value)? nicknameSaved,
    TResult Function(NicknameStateError value)? error,
    required TResult orElse(),
  }) {
    if (nicknameSaved != null) {
      return nicknameSaved(this);
    }
    return orElse();
  }
}

abstract class NicknameStateNicknameSaved implements NicknameState {
  const factory NicknameStateNicknameSaved() = _$NicknameStateNicknameSavedImpl;
}

/// @nodoc
abstract class _$$NicknameStateErrorImplCopyWith<$Res> {
  factory _$$NicknameStateErrorImplCopyWith(
    _$NicknameStateErrorImpl value,
    $Res Function(_$NicknameStateErrorImpl) then,
  ) = __$$NicknameStateErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$NicknameStateErrorImplCopyWithImpl<$Res>
    extends _$NicknameStateCopyWithImpl<$Res, _$NicknameStateErrorImpl>
    implements _$$NicknameStateErrorImplCopyWith<$Res> {
  __$$NicknameStateErrorImplCopyWithImpl(
    _$NicknameStateErrorImpl _value,
    $Res Function(_$NicknameStateErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of NicknameState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$NicknameStateErrorImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$NicknameStateErrorImpl implements NicknameStateError {
  const _$NicknameStateErrorImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'NicknameState.error(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NicknameStateErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of NicknameState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NicknameStateErrorImplCopyWith<_$NicknameStateErrorImpl> get copyWith =>
      __$$NicknameStateErrorImplCopyWithImpl<_$NicknameStateErrorImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() nicknameSaved,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? nicknameSaved,
    TResult? Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? nicknameSaved,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NicknameStateInitial value) initial,
    required TResult Function(NicknameStateNicknameSaved value) nicknameSaved,
    required TResult Function(NicknameStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(NicknameStateInitial value)? initial,
    TResult? Function(NicknameStateNicknameSaved value)? nicknameSaved,
    TResult? Function(NicknameStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NicknameStateInitial value)? initial,
    TResult Function(NicknameStateNicknameSaved value)? nicknameSaved,
    TResult Function(NicknameStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class NicknameStateError implements NicknameState {
  const factory NicknameStateError({required final String message}) =
      _$NicknameStateErrorImpl;

  String get message;

  /// Create a copy of NicknameState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NicknameStateErrorImplCopyWith<_$NicknameStateErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
