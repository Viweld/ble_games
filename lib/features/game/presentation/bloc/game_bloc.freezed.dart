// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$GameEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() onInitializationRequested,
    required TResult Function(int row, int column) onCellTapped,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? onInitializationRequested,
    TResult? Function(int row, int column)? onCellTapped,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onInitializationRequested,
    TResult Function(int row, int column)? onCellTapped,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GameEventOnInitializationRequested value)
    onInitializationRequested,
    required TResult Function(GameEventOnCellTapped value) onCellTapped,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GameEventOnInitializationRequested value)?
    onInitializationRequested,
    TResult? Function(GameEventOnCellTapped value)? onCellTapped,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GameEventOnInitializationRequested value)?
    onInitializationRequested,
    TResult Function(GameEventOnCellTapped value)? onCellTapped,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameEventCopyWith<$Res> {
  factory $GameEventCopyWith(GameEvent value, $Res Function(GameEvent) then) =
      _$GameEventCopyWithImpl<$Res, GameEvent>;
}

/// @nodoc
class _$GameEventCopyWithImpl<$Res, $Val extends GameEvent>
    implements $GameEventCopyWith<$Res> {
  _$GameEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GameEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GameEventOnInitializationRequestedImplCopyWith<$Res> {
  factory _$$GameEventOnInitializationRequestedImplCopyWith(
    _$GameEventOnInitializationRequestedImpl value,
    $Res Function(_$GameEventOnInitializationRequestedImpl) then,
  ) = __$$GameEventOnInitializationRequestedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GameEventOnInitializationRequestedImplCopyWithImpl<$Res>
    extends
        _$GameEventCopyWithImpl<$Res, _$GameEventOnInitializationRequestedImpl>
    implements _$$GameEventOnInitializationRequestedImplCopyWith<$Res> {
  __$$GameEventOnInitializationRequestedImplCopyWithImpl(
    _$GameEventOnInitializationRequestedImpl _value,
    $Res Function(_$GameEventOnInitializationRequestedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GameEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GameEventOnInitializationRequestedImpl
    implements GameEventOnInitializationRequested {
  const _$GameEventOnInitializationRequestedImpl();

  @override
  String toString() {
    return 'GameEvent.onInitializationRequested()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameEventOnInitializationRequestedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() onInitializationRequested,
    required TResult Function(int row, int column) onCellTapped,
  }) {
    return onInitializationRequested();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? onInitializationRequested,
    TResult? Function(int row, int column)? onCellTapped,
  }) {
    return onInitializationRequested?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onInitializationRequested,
    TResult Function(int row, int column)? onCellTapped,
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
    required TResult Function(GameEventOnInitializationRequested value)
    onInitializationRequested,
    required TResult Function(GameEventOnCellTapped value) onCellTapped,
  }) {
    return onInitializationRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GameEventOnInitializationRequested value)?
    onInitializationRequested,
    TResult? Function(GameEventOnCellTapped value)? onCellTapped,
  }) {
    return onInitializationRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GameEventOnInitializationRequested value)?
    onInitializationRequested,
    TResult Function(GameEventOnCellTapped value)? onCellTapped,
    required TResult orElse(),
  }) {
    if (onInitializationRequested != null) {
      return onInitializationRequested(this);
    }
    return orElse();
  }
}

abstract class GameEventOnInitializationRequested implements GameEvent {
  const factory GameEventOnInitializationRequested() =
      _$GameEventOnInitializationRequestedImpl;
}

/// @nodoc
abstract class _$$GameEventOnCellTappedImplCopyWith<$Res> {
  factory _$$GameEventOnCellTappedImplCopyWith(
    _$GameEventOnCellTappedImpl value,
    $Res Function(_$GameEventOnCellTappedImpl) then,
  ) = __$$GameEventOnCellTappedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int row, int column});
}

/// @nodoc
class __$$GameEventOnCellTappedImplCopyWithImpl<$Res>
    extends _$GameEventCopyWithImpl<$Res, _$GameEventOnCellTappedImpl>
    implements _$$GameEventOnCellTappedImplCopyWith<$Res> {
  __$$GameEventOnCellTappedImplCopyWithImpl(
    _$GameEventOnCellTappedImpl _value,
    $Res Function(_$GameEventOnCellTappedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GameEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? row = null, Object? column = null}) {
    return _then(
      _$GameEventOnCellTappedImpl(
        row: null == row
            ? _value.row
            : row // ignore: cast_nullable_to_non_nullable
                  as int,
        column: null == column
            ? _value.column
            : column // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$GameEventOnCellTappedImpl implements GameEventOnCellTapped {
  const _$GameEventOnCellTappedImpl({required this.row, required this.column});

  @override
  final int row;
  @override
  final int column;

  @override
  String toString() {
    return 'GameEvent.onCellTapped(row: $row, column: $column)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameEventOnCellTappedImpl &&
            (identical(other.row, row) || other.row == row) &&
            (identical(other.column, column) || other.column == column));
  }

  @override
  int get hashCode => Object.hash(runtimeType, row, column);

  /// Create a copy of GameEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GameEventOnCellTappedImplCopyWith<_$GameEventOnCellTappedImpl>
  get copyWith =>
      __$$GameEventOnCellTappedImplCopyWithImpl<_$GameEventOnCellTappedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() onInitializationRequested,
    required TResult Function(int row, int column) onCellTapped,
  }) {
    return onCellTapped(row, column);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? onInitializationRequested,
    TResult? Function(int row, int column)? onCellTapped,
  }) {
    return onCellTapped?.call(row, column);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? onInitializationRequested,
    TResult Function(int row, int column)? onCellTapped,
    required TResult orElse(),
  }) {
    if (onCellTapped != null) {
      return onCellTapped(row, column);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GameEventOnInitializationRequested value)
    onInitializationRequested,
    required TResult Function(GameEventOnCellTapped value) onCellTapped,
  }) {
    return onCellTapped(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GameEventOnInitializationRequested value)?
    onInitializationRequested,
    TResult? Function(GameEventOnCellTapped value)? onCellTapped,
  }) {
    return onCellTapped?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GameEventOnInitializationRequested value)?
    onInitializationRequested,
    TResult Function(GameEventOnCellTapped value)? onCellTapped,
    required TResult orElse(),
  }) {
    if (onCellTapped != null) {
      return onCellTapped(this);
    }
    return orElse();
  }
}

abstract class GameEventOnCellTapped implements GameEvent {
  const factory GameEventOnCellTapped({
    required final int row,
    required final int column,
  }) = _$GameEventOnCellTappedImpl;

  int get row;
  int get column;

  /// Create a copy of GameEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GameEventOnCellTappedImplCopyWith<_$GameEventOnCellTappedImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$GameState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializationPending,
    required TResult Function(String message) initializationError,
    required TResult Function(
      List<List<PlayerType?>> gameBoard,
      PlayerType currentPlayer,
      PlayerType playerType,
      GameWinner gameWinner,
    )
    view,
    required TResult Function() connectionLost,
    required TResult Function() opponentLeft,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initializationPending,
    TResult? Function(String message)? initializationError,
    TResult? Function(
      List<List<PlayerType?>> gameBoard,
      PlayerType currentPlayer,
      PlayerType playerType,
      GameWinner gameWinner,
    )?
    view,
    TResult? Function()? connectionLost,
    TResult? Function()? opponentLeft,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializationPending,
    TResult Function(String message)? initializationError,
    TResult Function(
      List<List<PlayerType?>> gameBoard,
      PlayerType currentPlayer,
      PlayerType playerType,
      GameWinner gameWinner,
    )?
    view,
    TResult Function()? connectionLost,
    TResult Function()? opponentLeft,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GameStateInitializationPending value)
    initializationPending,
    required TResult Function(GameStateInitializationError value)
    initializationError,
    required TResult Function(GameStateView value) view,
    required TResult Function(GameStateConnectionLost value) connectionLost,
    required TResult Function(GameStateOpponentLeft value) opponentLeft,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GameStateInitializationPending value)?
    initializationPending,
    TResult? Function(GameStateInitializationError value)? initializationError,
    TResult? Function(GameStateView value)? view,
    TResult? Function(GameStateConnectionLost value)? connectionLost,
    TResult? Function(GameStateOpponentLeft value)? opponentLeft,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GameStateInitializationPending value)?
    initializationPending,
    TResult Function(GameStateInitializationError value)? initializationError,
    TResult Function(GameStateView value)? view,
    TResult Function(GameStateConnectionLost value)? connectionLost,
    TResult Function(GameStateOpponentLeft value)? opponentLeft,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameStateCopyWith<$Res> {
  factory $GameStateCopyWith(GameState value, $Res Function(GameState) then) =
      _$GameStateCopyWithImpl<$Res, GameState>;
}

/// @nodoc
class _$GameStateCopyWithImpl<$Res, $Val extends GameState>
    implements $GameStateCopyWith<$Res> {
  _$GameStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$GameStateInitializationPendingImplCopyWith<$Res> {
  factory _$$GameStateInitializationPendingImplCopyWith(
    _$GameStateInitializationPendingImpl value,
    $Res Function(_$GameStateInitializationPendingImpl) then,
  ) = __$$GameStateInitializationPendingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GameStateInitializationPendingImplCopyWithImpl<$Res>
    extends _$GameStateCopyWithImpl<$Res, _$GameStateInitializationPendingImpl>
    implements _$$GameStateInitializationPendingImplCopyWith<$Res> {
  __$$GameStateInitializationPendingImplCopyWithImpl(
    _$GameStateInitializationPendingImpl _value,
    $Res Function(_$GameStateInitializationPendingImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GameStateInitializationPendingImpl
    implements GameStateInitializationPending {
  const _$GameStateInitializationPendingImpl();

  @override
  String toString() {
    return 'GameState.initializationPending()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameStateInitializationPendingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializationPending,
    required TResult Function(String message) initializationError,
    required TResult Function(
      List<List<PlayerType?>> gameBoard,
      PlayerType currentPlayer,
      PlayerType playerType,
      GameWinner gameWinner,
    )
    view,
    required TResult Function() connectionLost,
    required TResult Function() opponentLeft,
  }) {
    return initializationPending();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initializationPending,
    TResult? Function(String message)? initializationError,
    TResult? Function(
      List<List<PlayerType?>> gameBoard,
      PlayerType currentPlayer,
      PlayerType playerType,
      GameWinner gameWinner,
    )?
    view,
    TResult? Function()? connectionLost,
    TResult? Function()? opponentLeft,
  }) {
    return initializationPending?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializationPending,
    TResult Function(String message)? initializationError,
    TResult Function(
      List<List<PlayerType?>> gameBoard,
      PlayerType currentPlayer,
      PlayerType playerType,
      GameWinner gameWinner,
    )?
    view,
    TResult Function()? connectionLost,
    TResult Function()? opponentLeft,
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
    required TResult Function(GameStateInitializationPending value)
    initializationPending,
    required TResult Function(GameStateInitializationError value)
    initializationError,
    required TResult Function(GameStateView value) view,
    required TResult Function(GameStateConnectionLost value) connectionLost,
    required TResult Function(GameStateOpponentLeft value) opponentLeft,
  }) {
    return initializationPending(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GameStateInitializationPending value)?
    initializationPending,
    TResult? Function(GameStateInitializationError value)? initializationError,
    TResult? Function(GameStateView value)? view,
    TResult? Function(GameStateConnectionLost value)? connectionLost,
    TResult? Function(GameStateOpponentLeft value)? opponentLeft,
  }) {
    return initializationPending?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GameStateInitializationPending value)?
    initializationPending,
    TResult Function(GameStateInitializationError value)? initializationError,
    TResult Function(GameStateView value)? view,
    TResult Function(GameStateConnectionLost value)? connectionLost,
    TResult Function(GameStateOpponentLeft value)? opponentLeft,
    required TResult orElse(),
  }) {
    if (initializationPending != null) {
      return initializationPending(this);
    }
    return orElse();
  }
}

abstract class GameStateInitializationPending implements GameState {
  const factory GameStateInitializationPending() =
      _$GameStateInitializationPendingImpl;
}

/// @nodoc
abstract class _$$GameStateInitializationErrorImplCopyWith<$Res> {
  factory _$$GameStateInitializationErrorImplCopyWith(
    _$GameStateInitializationErrorImpl value,
    $Res Function(_$GameStateInitializationErrorImpl) then,
  ) = __$$GameStateInitializationErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$GameStateInitializationErrorImplCopyWithImpl<$Res>
    extends _$GameStateCopyWithImpl<$Res, _$GameStateInitializationErrorImpl>
    implements _$$GameStateInitializationErrorImplCopyWith<$Res> {
  __$$GameStateInitializationErrorImplCopyWithImpl(
    _$GameStateInitializationErrorImpl _value,
    $Res Function(_$GameStateInitializationErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$GameStateInitializationErrorImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$GameStateInitializationErrorImpl
    implements GameStateInitializationError {
  const _$GameStateInitializationErrorImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'GameState.initializationError(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameStateInitializationErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GameStateInitializationErrorImplCopyWith<
    _$GameStateInitializationErrorImpl
  >
  get copyWith =>
      __$$GameStateInitializationErrorImplCopyWithImpl<
        _$GameStateInitializationErrorImpl
      >(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializationPending,
    required TResult Function(String message) initializationError,
    required TResult Function(
      List<List<PlayerType?>> gameBoard,
      PlayerType currentPlayer,
      PlayerType playerType,
      GameWinner gameWinner,
    )
    view,
    required TResult Function() connectionLost,
    required TResult Function() opponentLeft,
  }) {
    return initializationError(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initializationPending,
    TResult? Function(String message)? initializationError,
    TResult? Function(
      List<List<PlayerType?>> gameBoard,
      PlayerType currentPlayer,
      PlayerType playerType,
      GameWinner gameWinner,
    )?
    view,
    TResult? Function()? connectionLost,
    TResult? Function()? opponentLeft,
  }) {
    return initializationError?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializationPending,
    TResult Function(String message)? initializationError,
    TResult Function(
      List<List<PlayerType?>> gameBoard,
      PlayerType currentPlayer,
      PlayerType playerType,
      GameWinner gameWinner,
    )?
    view,
    TResult Function()? connectionLost,
    TResult Function()? opponentLeft,
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
    required TResult Function(GameStateInitializationPending value)
    initializationPending,
    required TResult Function(GameStateInitializationError value)
    initializationError,
    required TResult Function(GameStateView value) view,
    required TResult Function(GameStateConnectionLost value) connectionLost,
    required TResult Function(GameStateOpponentLeft value) opponentLeft,
  }) {
    return initializationError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GameStateInitializationPending value)?
    initializationPending,
    TResult? Function(GameStateInitializationError value)? initializationError,
    TResult? Function(GameStateView value)? view,
    TResult? Function(GameStateConnectionLost value)? connectionLost,
    TResult? Function(GameStateOpponentLeft value)? opponentLeft,
  }) {
    return initializationError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GameStateInitializationPending value)?
    initializationPending,
    TResult Function(GameStateInitializationError value)? initializationError,
    TResult Function(GameStateView value)? view,
    TResult Function(GameStateConnectionLost value)? connectionLost,
    TResult Function(GameStateOpponentLeft value)? opponentLeft,
    required TResult orElse(),
  }) {
    if (initializationError != null) {
      return initializationError(this);
    }
    return orElse();
  }
}

abstract class GameStateInitializationError implements GameState {
  const factory GameStateInitializationError({required final String message}) =
      _$GameStateInitializationErrorImpl;

  String get message;

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GameStateInitializationErrorImplCopyWith<
    _$GameStateInitializationErrorImpl
  >
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GameStateViewImplCopyWith<$Res> {
  factory _$$GameStateViewImplCopyWith(
    _$GameStateViewImpl value,
    $Res Function(_$GameStateViewImpl) then,
  ) = __$$GameStateViewImplCopyWithImpl<$Res>;
  @useResult
  $Res call({
    List<List<PlayerType?>> gameBoard,
    PlayerType currentPlayer,
    PlayerType playerType,
    GameWinner gameWinner,
  });
}

/// @nodoc
class __$$GameStateViewImplCopyWithImpl<$Res>
    extends _$GameStateCopyWithImpl<$Res, _$GameStateViewImpl>
    implements _$$GameStateViewImplCopyWith<$Res> {
  __$$GameStateViewImplCopyWithImpl(
    _$GameStateViewImpl _value,
    $Res Function(_$GameStateViewImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gameBoard = null,
    Object? currentPlayer = null,
    Object? playerType = null,
    Object? gameWinner = null,
  }) {
    return _then(
      _$GameStateViewImpl(
        gameBoard: null == gameBoard
            ? _value._gameBoard
            : gameBoard // ignore: cast_nullable_to_non_nullable
                  as List<List<PlayerType?>>,
        currentPlayer: null == currentPlayer
            ? _value.currentPlayer
            : currentPlayer // ignore: cast_nullable_to_non_nullable
                  as PlayerType,
        playerType: null == playerType
            ? _value.playerType
            : playerType // ignore: cast_nullable_to_non_nullable
                  as PlayerType,
        gameWinner: null == gameWinner
            ? _value.gameWinner
            : gameWinner // ignore: cast_nullable_to_non_nullable
                  as GameWinner,
      ),
    );
  }
}

/// @nodoc

class _$GameStateViewImpl implements GameStateView {
  const _$GameStateViewImpl({
    required final List<List<PlayerType?>> gameBoard,
    required this.currentPlayer,
    required this.playerType,
    required this.gameWinner,
  }) : _gameBoard = gameBoard;

  final List<List<PlayerType?>> _gameBoard;
  @override
  List<List<PlayerType?>> get gameBoard {
    if (_gameBoard is EqualUnmodifiableListView) return _gameBoard;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_gameBoard);
  }

  @override
  final PlayerType currentPlayer;
  @override
  final PlayerType playerType;
  @override
  final GameWinner gameWinner;

  @override
  String toString() {
    return 'GameState.view(gameBoard: $gameBoard, currentPlayer: $currentPlayer, playerType: $playerType, gameWinner: $gameWinner)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameStateViewImpl &&
            const DeepCollectionEquality().equals(
              other._gameBoard,
              _gameBoard,
            ) &&
            (identical(other.currentPlayer, currentPlayer) ||
                other.currentPlayer == currentPlayer) &&
            (identical(other.playerType, playerType) ||
                other.playerType == playerType) &&
            (identical(other.gameWinner, gameWinner) ||
                other.gameWinner == gameWinner));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_gameBoard),
    currentPlayer,
    playerType,
    gameWinner,
  );

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GameStateViewImplCopyWith<_$GameStateViewImpl> get copyWith =>
      __$$GameStateViewImplCopyWithImpl<_$GameStateViewImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializationPending,
    required TResult Function(String message) initializationError,
    required TResult Function(
      List<List<PlayerType?>> gameBoard,
      PlayerType currentPlayer,
      PlayerType playerType,
      GameWinner gameWinner,
    )
    view,
    required TResult Function() connectionLost,
    required TResult Function() opponentLeft,
  }) {
    return view(gameBoard, currentPlayer, playerType, gameWinner);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initializationPending,
    TResult? Function(String message)? initializationError,
    TResult? Function(
      List<List<PlayerType?>> gameBoard,
      PlayerType currentPlayer,
      PlayerType playerType,
      GameWinner gameWinner,
    )?
    view,
    TResult? Function()? connectionLost,
    TResult? Function()? opponentLeft,
  }) {
    return view?.call(gameBoard, currentPlayer, playerType, gameWinner);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializationPending,
    TResult Function(String message)? initializationError,
    TResult Function(
      List<List<PlayerType?>> gameBoard,
      PlayerType currentPlayer,
      PlayerType playerType,
      GameWinner gameWinner,
    )?
    view,
    TResult Function()? connectionLost,
    TResult Function()? opponentLeft,
    required TResult orElse(),
  }) {
    if (view != null) {
      return view(gameBoard, currentPlayer, playerType, gameWinner);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GameStateInitializationPending value)
    initializationPending,
    required TResult Function(GameStateInitializationError value)
    initializationError,
    required TResult Function(GameStateView value) view,
    required TResult Function(GameStateConnectionLost value) connectionLost,
    required TResult Function(GameStateOpponentLeft value) opponentLeft,
  }) {
    return view(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GameStateInitializationPending value)?
    initializationPending,
    TResult? Function(GameStateInitializationError value)? initializationError,
    TResult? Function(GameStateView value)? view,
    TResult? Function(GameStateConnectionLost value)? connectionLost,
    TResult? Function(GameStateOpponentLeft value)? opponentLeft,
  }) {
    return view?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GameStateInitializationPending value)?
    initializationPending,
    TResult Function(GameStateInitializationError value)? initializationError,
    TResult Function(GameStateView value)? view,
    TResult Function(GameStateConnectionLost value)? connectionLost,
    TResult Function(GameStateOpponentLeft value)? opponentLeft,
    required TResult orElse(),
  }) {
    if (view != null) {
      return view(this);
    }
    return orElse();
  }
}

abstract class GameStateView implements GameState {
  const factory GameStateView({
    required final List<List<PlayerType?>> gameBoard,
    required final PlayerType currentPlayer,
    required final PlayerType playerType,
    required final GameWinner gameWinner,
  }) = _$GameStateViewImpl;

  List<List<PlayerType?>> get gameBoard;
  PlayerType get currentPlayer;
  PlayerType get playerType;
  GameWinner get gameWinner;

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GameStateViewImplCopyWith<_$GameStateViewImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GameStateConnectionLostImplCopyWith<$Res> {
  factory _$$GameStateConnectionLostImplCopyWith(
    _$GameStateConnectionLostImpl value,
    $Res Function(_$GameStateConnectionLostImpl) then,
  ) = __$$GameStateConnectionLostImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GameStateConnectionLostImplCopyWithImpl<$Res>
    extends _$GameStateCopyWithImpl<$Res, _$GameStateConnectionLostImpl>
    implements _$$GameStateConnectionLostImplCopyWith<$Res> {
  __$$GameStateConnectionLostImplCopyWithImpl(
    _$GameStateConnectionLostImpl _value,
    $Res Function(_$GameStateConnectionLostImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GameStateConnectionLostImpl implements GameStateConnectionLost {
  const _$GameStateConnectionLostImpl();

  @override
  String toString() {
    return 'GameState.connectionLost()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameStateConnectionLostImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializationPending,
    required TResult Function(String message) initializationError,
    required TResult Function(
      List<List<PlayerType?>> gameBoard,
      PlayerType currentPlayer,
      PlayerType playerType,
      GameWinner gameWinner,
    )
    view,
    required TResult Function() connectionLost,
    required TResult Function() opponentLeft,
  }) {
    return connectionLost();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initializationPending,
    TResult? Function(String message)? initializationError,
    TResult? Function(
      List<List<PlayerType?>> gameBoard,
      PlayerType currentPlayer,
      PlayerType playerType,
      GameWinner gameWinner,
    )?
    view,
    TResult? Function()? connectionLost,
    TResult? Function()? opponentLeft,
  }) {
    return connectionLost?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializationPending,
    TResult Function(String message)? initializationError,
    TResult Function(
      List<List<PlayerType?>> gameBoard,
      PlayerType currentPlayer,
      PlayerType playerType,
      GameWinner gameWinner,
    )?
    view,
    TResult Function()? connectionLost,
    TResult Function()? opponentLeft,
    required TResult orElse(),
  }) {
    if (connectionLost != null) {
      return connectionLost();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GameStateInitializationPending value)
    initializationPending,
    required TResult Function(GameStateInitializationError value)
    initializationError,
    required TResult Function(GameStateView value) view,
    required TResult Function(GameStateConnectionLost value) connectionLost,
    required TResult Function(GameStateOpponentLeft value) opponentLeft,
  }) {
    return connectionLost(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GameStateInitializationPending value)?
    initializationPending,
    TResult? Function(GameStateInitializationError value)? initializationError,
    TResult? Function(GameStateView value)? view,
    TResult? Function(GameStateConnectionLost value)? connectionLost,
    TResult? Function(GameStateOpponentLeft value)? opponentLeft,
  }) {
    return connectionLost?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GameStateInitializationPending value)?
    initializationPending,
    TResult Function(GameStateInitializationError value)? initializationError,
    TResult Function(GameStateView value)? view,
    TResult Function(GameStateConnectionLost value)? connectionLost,
    TResult Function(GameStateOpponentLeft value)? opponentLeft,
    required TResult orElse(),
  }) {
    if (connectionLost != null) {
      return connectionLost(this);
    }
    return orElse();
  }
}

abstract class GameStateConnectionLost implements GameState {
  const factory GameStateConnectionLost() = _$GameStateConnectionLostImpl;
}

/// @nodoc
abstract class _$$GameStateOpponentLeftImplCopyWith<$Res> {
  factory _$$GameStateOpponentLeftImplCopyWith(
    _$GameStateOpponentLeftImpl value,
    $Res Function(_$GameStateOpponentLeftImpl) then,
  ) = __$$GameStateOpponentLeftImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GameStateOpponentLeftImplCopyWithImpl<$Res>
    extends _$GameStateCopyWithImpl<$Res, _$GameStateOpponentLeftImpl>
    implements _$$GameStateOpponentLeftImplCopyWith<$Res> {
  __$$GameStateOpponentLeftImplCopyWithImpl(
    _$GameStateOpponentLeftImpl _value,
    $Res Function(_$GameStateOpponentLeftImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of GameState
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GameStateOpponentLeftImpl implements GameStateOpponentLeft {
  const _$GameStateOpponentLeftImpl();

  @override
  String toString() {
    return 'GameState.opponentLeft()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameStateOpponentLeftImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializationPending,
    required TResult Function(String message) initializationError,
    required TResult Function(
      List<List<PlayerType?>> gameBoard,
      PlayerType currentPlayer,
      PlayerType playerType,
      GameWinner gameWinner,
    )
    view,
    required TResult Function() connectionLost,
    required TResult Function() opponentLeft,
  }) {
    return opponentLeft();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initializationPending,
    TResult? Function(String message)? initializationError,
    TResult? Function(
      List<List<PlayerType?>> gameBoard,
      PlayerType currentPlayer,
      PlayerType playerType,
      GameWinner gameWinner,
    )?
    view,
    TResult? Function()? connectionLost,
    TResult? Function()? opponentLeft,
  }) {
    return opponentLeft?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializationPending,
    TResult Function(String message)? initializationError,
    TResult Function(
      List<List<PlayerType?>> gameBoard,
      PlayerType currentPlayer,
      PlayerType playerType,
      GameWinner gameWinner,
    )?
    view,
    TResult Function()? connectionLost,
    TResult Function()? opponentLeft,
    required TResult orElse(),
  }) {
    if (opponentLeft != null) {
      return opponentLeft();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GameStateInitializationPending value)
    initializationPending,
    required TResult Function(GameStateInitializationError value)
    initializationError,
    required TResult Function(GameStateView value) view,
    required TResult Function(GameStateConnectionLost value) connectionLost,
    required TResult Function(GameStateOpponentLeft value) opponentLeft,
  }) {
    return opponentLeft(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(GameStateInitializationPending value)?
    initializationPending,
    TResult? Function(GameStateInitializationError value)? initializationError,
    TResult? Function(GameStateView value)? view,
    TResult? Function(GameStateConnectionLost value)? connectionLost,
    TResult? Function(GameStateOpponentLeft value)? opponentLeft,
  }) {
    return opponentLeft?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GameStateInitializationPending value)?
    initializationPending,
    TResult Function(GameStateInitializationError value)? initializationError,
    TResult Function(GameStateView value)? view,
    TResult Function(GameStateConnectionLost value)? connectionLost,
    TResult Function(GameStateOpponentLeft value)? opponentLeft,
    required TResult orElse(),
  }) {
    if (opponentLeft != null) {
      return opponentLeft(this);
    }
    return orElse();
  }
}

abstract class GameStateOpponentLeft implements GameState {
  const factory GameStateOpponentLeft() = _$GameStateOpponentLeftImpl;
}
