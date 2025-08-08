// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'splash_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$SplashEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() onInitializationRequested,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? onInitializationRequested,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onInitializationRequested,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SplashEventOnInitializationRequested value)
    onInitializationRequested,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SplashEventOnInitializationRequested value)?
    onInitializationRequested,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SplashEventOnInitializationRequested value)?
    onInitializationRequested,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SplashEventCopyWith<$Res> {
  factory $SplashEventCopyWith(
    SplashEvent value,
    $Res Function(SplashEvent) then,
  ) = _$SplashEventCopyWithImpl<$Res, SplashEvent>;
}

/// @nodoc
class _$SplashEventCopyWithImpl<$Res, $Val extends SplashEvent>
    implements $SplashEventCopyWith<$Res> {
  _$SplashEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SplashEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$SplashEventOnInitializationRequestedImplCopyWith<$Res> {
  factory _$$SplashEventOnInitializationRequestedImplCopyWith(
    _$SplashEventOnInitializationRequestedImpl value,
    $Res Function(_$SplashEventOnInitializationRequestedImpl) then,
  ) = __$$SplashEventOnInitializationRequestedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SplashEventOnInitializationRequestedImplCopyWithImpl<$Res>
    extends
        _$SplashEventCopyWithImpl<
          $Res,
          _$SplashEventOnInitializationRequestedImpl
        >
    implements _$$SplashEventOnInitializationRequestedImplCopyWith<$Res> {
  __$$SplashEventOnInitializationRequestedImplCopyWithImpl(
    _$SplashEventOnInitializationRequestedImpl _value,
    $Res Function(_$SplashEventOnInitializationRequestedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SplashEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SplashEventOnInitializationRequestedImpl
    implements SplashEventOnInitializationRequested {
  const _$SplashEventOnInitializationRequestedImpl();

  @override
  String toString() {
    return 'SplashEvent.onInitializationRequested()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SplashEventOnInitializationRequestedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() onInitializationRequested,
  }) {
    return onInitializationRequested();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? onInitializationRequested,
  }) {
    return onInitializationRequested?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onInitializationRequested,
    required TResult orElse(),
  }) {
    if (onInitializationRequested != null) {
      return onInitializationRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SplashEventOnInitializationRequested value)
    onInitializationRequested,
  }) {
    return onInitializationRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SplashEventOnInitializationRequested value)?
    onInitializationRequested,
  }) {
    return onInitializationRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SplashEventOnInitializationRequested value)?
    onInitializationRequested,
    required TResult orElse(),
  }) {
    if (onInitializationRequested != null) {
      return onInitializationRequested(this);
    }
    return orElse();
  }
}

abstract class SplashEventOnInitializationRequested implements SplashEvent {
  const factory SplashEventOnInitializationRequested() =
      _$SplashEventOnInitializationRequestedImpl;
}

/// @nodoc
mixin _$SplashState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializationPending,
    required TResult Function(String message) initializationError,
    required TResult Function() view,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initializationPending,
    TResult? Function(String message)? initializationError,
    TResult? Function()? view,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializationPending,
    TResult Function(String message)? initializationError,
    TResult Function()? view,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SplashStateInitializationPending value)
    initializationPending,
    required TResult Function(SplashStateInitializationError value)
    initializationError,
    required TResult Function(SplashStateView value) view,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SplashStateInitializationPending value)?
    initializationPending,
    TResult? Function(SplashStateInitializationError value)?
    initializationError,
    TResult? Function(SplashStateView value)? view,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SplashStateInitializationPending value)?
    initializationPending,
    TResult Function(SplashStateInitializationError value)? initializationError,
    TResult Function(SplashStateView value)? view,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SplashStateCopyWith<$Res> {
  factory $SplashStateCopyWith(
    SplashState value,
    $Res Function(SplashState) then,
  ) = _$SplashStateCopyWithImpl<$Res, SplashState>;
}

/// @nodoc
class _$SplashStateCopyWithImpl<$Res, $Val extends SplashState>
    implements $SplashStateCopyWith<$Res> {
  _$SplashStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SplashState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$SplashStateInitializationPendingImplCopyWith<$Res> {
  factory _$$SplashStateInitializationPendingImplCopyWith(
    _$SplashStateInitializationPendingImpl value,
    $Res Function(_$SplashStateInitializationPendingImpl) then,
  ) = __$$SplashStateInitializationPendingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SplashStateInitializationPendingImplCopyWithImpl<$Res>
    extends
        _$SplashStateCopyWithImpl<$Res, _$SplashStateInitializationPendingImpl>
    implements _$$SplashStateInitializationPendingImplCopyWith<$Res> {
  __$$SplashStateInitializationPendingImplCopyWithImpl(
    _$SplashStateInitializationPendingImpl _value,
    $Res Function(_$SplashStateInitializationPendingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SplashState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SplashStateInitializationPendingImpl
    implements SplashStateInitializationPending {
  const _$SplashStateInitializationPendingImpl();

  @override
  String toString() {
    return 'SplashState.initializationPending()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SplashStateInitializationPendingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializationPending,
    required TResult Function(String message) initializationError,
    required TResult Function() view,
  }) {
    return initializationPending();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initializationPending,
    TResult? Function(String message)? initializationError,
    TResult? Function()? view,
  }) {
    return initializationPending?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializationPending,
    TResult Function(String message)? initializationError,
    TResult Function()? view,
    required TResult orElse(),
  }) {
    if (initializationPending != null) {
      return initializationPending();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SplashStateInitializationPending value)
    initializationPending,
    required TResult Function(SplashStateInitializationError value)
    initializationError,
    required TResult Function(SplashStateView value) view,
  }) {
    return initializationPending(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SplashStateInitializationPending value)?
    initializationPending,
    TResult? Function(SplashStateInitializationError value)?
    initializationError,
    TResult? Function(SplashStateView value)? view,
  }) {
    return initializationPending?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SplashStateInitializationPending value)?
    initializationPending,
    TResult Function(SplashStateInitializationError value)? initializationError,
    TResult Function(SplashStateView value)? view,
    required TResult orElse(),
  }) {
    if (initializationPending != null) {
      return initializationPending(this);
    }
    return orElse();
  }
}

abstract class SplashStateInitializationPending implements SplashState {
  const factory SplashStateInitializationPending() =
      _$SplashStateInitializationPendingImpl;
}

/// @nodoc
abstract class _$$SplashStateInitializationErrorImplCopyWith<$Res> {
  factory _$$SplashStateInitializationErrorImplCopyWith(
    _$SplashStateInitializationErrorImpl value,
    $Res Function(_$SplashStateInitializationErrorImpl) then,
  ) = __$$SplashStateInitializationErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$SplashStateInitializationErrorImplCopyWithImpl<$Res>
    extends
        _$SplashStateCopyWithImpl<$Res, _$SplashStateInitializationErrorImpl>
    implements _$$SplashStateInitializationErrorImplCopyWith<$Res> {
  __$$SplashStateInitializationErrorImplCopyWithImpl(
    _$SplashStateInitializationErrorImpl _value,
    $Res Function(_$SplashStateInitializationErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SplashState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$SplashStateInitializationErrorImpl(
        null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$SplashStateInitializationErrorImpl
    implements SplashStateInitializationError {
  const _$SplashStateInitializationErrorImpl(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'SplashState.initializationError(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SplashStateInitializationErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of SplashState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SplashStateInitializationErrorImplCopyWith<
    _$SplashStateInitializationErrorImpl
  >
  get copyWith =>
      __$$SplashStateInitializationErrorImplCopyWithImpl<
        _$SplashStateInitializationErrorImpl
      >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializationPending,
    required TResult Function(String message) initializationError,
    required TResult Function() view,
  }) {
    return initializationError(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initializationPending,
    TResult? Function(String message)? initializationError,
    TResult? Function()? view,
  }) {
    return initializationError?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializationPending,
    TResult Function(String message)? initializationError,
    TResult Function()? view,
    required TResult orElse(),
  }) {
    if (initializationError != null) {
      return initializationError(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SplashStateInitializationPending value)
    initializationPending,
    required TResult Function(SplashStateInitializationError value)
    initializationError,
    required TResult Function(SplashStateView value) view,
  }) {
    return initializationError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SplashStateInitializationPending value)?
    initializationPending,
    TResult? Function(SplashStateInitializationError value)?
    initializationError,
    TResult? Function(SplashStateView value)? view,
  }) {
    return initializationError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SplashStateInitializationPending value)?
    initializationPending,
    TResult Function(SplashStateInitializationError value)? initializationError,
    TResult Function(SplashStateView value)? view,
    required TResult orElse(),
  }) {
    if (initializationError != null) {
      return initializationError(this);
    }
    return orElse();
  }
}

abstract class SplashStateInitializationError implements SplashState {
  const factory SplashStateInitializationError(final String message) =
      _$SplashStateInitializationErrorImpl;

  String get message;

  /// Create a copy of SplashState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SplashStateInitializationErrorImplCopyWith<
    _$SplashStateInitializationErrorImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SplashStateViewImplCopyWith<$Res> {
  factory _$$SplashStateViewImplCopyWith(
    _$SplashStateViewImpl value,
    $Res Function(_$SplashStateViewImpl) then,
  ) = __$$SplashStateViewImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SplashStateViewImplCopyWithImpl<$Res>
    extends _$SplashStateCopyWithImpl<$Res, _$SplashStateViewImpl>
    implements _$$SplashStateViewImplCopyWith<$Res> {
  __$$SplashStateViewImplCopyWithImpl(
    _$SplashStateViewImpl _value,
    $Res Function(_$SplashStateViewImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of SplashState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$SplashStateViewImpl implements SplashStateView {
  const _$SplashStateViewImpl();

  @override
  String toString() {
    return 'SplashState.view()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$SplashStateViewImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializationPending,
    required TResult Function(String message) initializationError,
    required TResult Function() view,
  }) {
    return view();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initializationPending,
    TResult? Function(String message)? initializationError,
    TResult? Function()? view,
  }) {
    return view?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializationPending,
    TResult Function(String message)? initializationError,
    TResult Function()? view,
    required TResult orElse(),
  }) {
    if (view != null) {
      return view();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SplashStateInitializationPending value)
    initializationPending,
    required TResult Function(SplashStateInitializationError value)
    initializationError,
    required TResult Function(SplashStateView value) view,
  }) {
    return view(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(SplashStateInitializationPending value)?
    initializationPending,
    TResult? Function(SplashStateInitializationError value)?
    initializationError,
    TResult? Function(SplashStateView value)? view,
  }) {
    return view?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SplashStateInitializationPending value)?
    initializationPending,
    TResult Function(SplashStateInitializationError value)? initializationError,
    TResult Function(SplashStateView value)? view,
    required TResult orElse(),
  }) {
    if (view != null) {
      return view(this);
    }
    return orElse();
  }
}

abstract class SplashStateView implements SplashState {
  const factory SplashStateView() = _$SplashStateViewImpl;
}
