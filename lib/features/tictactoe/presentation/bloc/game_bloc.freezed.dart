// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GameEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GameEvent()';
}


}

/// @nodoc
class $GameEventCopyWith<$Res>  {
$GameEventCopyWith(GameEvent _, $Res Function(GameEvent) __);
}


/// Adds pattern-matching-related methods to [GameEvent].
extension GameEventPatterns on GameEvent {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( GameEventOnInitializationRequested value)?  onInitializationRequested,TResult Function( GameEventOnCellTapped value)?  onCellTapped,TResult Function( GameEventOnIncomingMove value)?  onIncomingMove,TResult Function( GameEventOnConnectionLost value)?  onConnectionLost,TResult Function( GameEventOnRoleAssigned value)?  onRoleAssigned,required TResult orElse(),}){
final _that = this;
switch (_that) {
case GameEventOnInitializationRequested() when onInitializationRequested != null:
return onInitializationRequested(_that);case GameEventOnCellTapped() when onCellTapped != null:
return onCellTapped(_that);case GameEventOnIncomingMove() when onIncomingMove != null:
return onIncomingMove(_that);case GameEventOnConnectionLost() when onConnectionLost != null:
return onConnectionLost(_that);case GameEventOnRoleAssigned() when onRoleAssigned != null:
return onRoleAssigned(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( GameEventOnInitializationRequested value)  onInitializationRequested,required TResult Function( GameEventOnCellTapped value)  onCellTapped,required TResult Function( GameEventOnIncomingMove value)  onIncomingMove,required TResult Function( GameEventOnConnectionLost value)  onConnectionLost,required TResult Function( GameEventOnRoleAssigned value)  onRoleAssigned,}){
final _that = this;
switch (_that) {
case GameEventOnInitializationRequested():
return onInitializationRequested(_that);case GameEventOnCellTapped():
return onCellTapped(_that);case GameEventOnIncomingMove():
return onIncomingMove(_that);case GameEventOnConnectionLost():
return onConnectionLost(_that);case GameEventOnRoleAssigned():
return onRoleAssigned(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( GameEventOnInitializationRequested value)?  onInitializationRequested,TResult? Function( GameEventOnCellTapped value)?  onCellTapped,TResult? Function( GameEventOnIncomingMove value)?  onIncomingMove,TResult? Function( GameEventOnConnectionLost value)?  onConnectionLost,TResult? Function( GameEventOnRoleAssigned value)?  onRoleAssigned,}){
final _that = this;
switch (_that) {
case GameEventOnInitializationRequested() when onInitializationRequested != null:
return onInitializationRequested(_that);case GameEventOnCellTapped() when onCellTapped != null:
return onCellTapped(_that);case GameEventOnIncomingMove() when onIncomingMove != null:
return onIncomingMove(_that);case GameEventOnConnectionLost() when onConnectionLost != null:
return onConnectionLost(_that);case GameEventOnRoleAssigned() when onRoleAssigned != null:
return onRoleAssigned(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  onInitializationRequested,TResult Function( int row,  int column)?  onCellTapped,TResult Function( int row,  int column,  PlayerType playerType)?  onIncomingMove,TResult Function()?  onConnectionLost,TResult Function( PlayerType myPlayerType)?  onRoleAssigned,required TResult orElse(),}) {final _that = this;
switch (_that) {
case GameEventOnInitializationRequested() when onInitializationRequested != null:
return onInitializationRequested();case GameEventOnCellTapped() when onCellTapped != null:
return onCellTapped(_that.row,_that.column);case GameEventOnIncomingMove() when onIncomingMove != null:
return onIncomingMove(_that.row,_that.column,_that.playerType);case GameEventOnConnectionLost() when onConnectionLost != null:
return onConnectionLost();case GameEventOnRoleAssigned() when onRoleAssigned != null:
return onRoleAssigned(_that.myPlayerType);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  onInitializationRequested,required TResult Function( int row,  int column)  onCellTapped,required TResult Function( int row,  int column,  PlayerType playerType)  onIncomingMove,required TResult Function()  onConnectionLost,required TResult Function( PlayerType myPlayerType)  onRoleAssigned,}) {final _that = this;
switch (_that) {
case GameEventOnInitializationRequested():
return onInitializationRequested();case GameEventOnCellTapped():
return onCellTapped(_that.row,_that.column);case GameEventOnIncomingMove():
return onIncomingMove(_that.row,_that.column,_that.playerType);case GameEventOnConnectionLost():
return onConnectionLost();case GameEventOnRoleAssigned():
return onRoleAssigned(_that.myPlayerType);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  onInitializationRequested,TResult? Function( int row,  int column)?  onCellTapped,TResult? Function( int row,  int column,  PlayerType playerType)?  onIncomingMove,TResult? Function()?  onConnectionLost,TResult? Function( PlayerType myPlayerType)?  onRoleAssigned,}) {final _that = this;
switch (_that) {
case GameEventOnInitializationRequested() when onInitializationRequested != null:
return onInitializationRequested();case GameEventOnCellTapped() when onCellTapped != null:
return onCellTapped(_that.row,_that.column);case GameEventOnIncomingMove() when onIncomingMove != null:
return onIncomingMove(_that.row,_that.column,_that.playerType);case GameEventOnConnectionLost() when onConnectionLost != null:
return onConnectionLost();case GameEventOnRoleAssigned() when onRoleAssigned != null:
return onRoleAssigned(_that.myPlayerType);case _:
  return null;

}
}

}

/// @nodoc


class GameEventOnInitializationRequested implements GameEvent {
  const GameEventOnInitializationRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameEventOnInitializationRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GameEvent.onInitializationRequested()';
}


}




/// @nodoc


class GameEventOnCellTapped implements GameEvent {
  const GameEventOnCellTapped({required this.row, required this.column});
  

 final  int row;
 final  int column;

/// Create a copy of GameEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GameEventOnCellTappedCopyWith<GameEventOnCellTapped> get copyWith => _$GameEventOnCellTappedCopyWithImpl<GameEventOnCellTapped>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameEventOnCellTapped&&(identical(other.row, row) || other.row == row)&&(identical(other.column, column) || other.column == column));
}


@override
int get hashCode => Object.hash(runtimeType,row,column);

@override
String toString() {
  return 'GameEvent.onCellTapped(row: $row, column: $column)';
}


}

/// @nodoc
abstract mixin class $GameEventOnCellTappedCopyWith<$Res> implements $GameEventCopyWith<$Res> {
  factory $GameEventOnCellTappedCopyWith(GameEventOnCellTapped value, $Res Function(GameEventOnCellTapped) _then) = _$GameEventOnCellTappedCopyWithImpl;
@useResult
$Res call({
 int row, int column
});




}
/// @nodoc
class _$GameEventOnCellTappedCopyWithImpl<$Res>
    implements $GameEventOnCellTappedCopyWith<$Res> {
  _$GameEventOnCellTappedCopyWithImpl(this._self, this._then);

  final GameEventOnCellTapped _self;
  final $Res Function(GameEventOnCellTapped) _then;

/// Create a copy of GameEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? row = null,Object? column = null,}) {
  return _then(GameEventOnCellTapped(
row: null == row ? _self.row : row // ignore: cast_nullable_to_non_nullable
as int,column: null == column ? _self.column : column // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class GameEventOnIncomingMove implements GameEvent {
  const GameEventOnIncomingMove({required this.row, required this.column, required this.playerType});
  

 final  int row;
 final  int column;
 final  PlayerType playerType;

/// Create a copy of GameEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GameEventOnIncomingMoveCopyWith<GameEventOnIncomingMove> get copyWith => _$GameEventOnIncomingMoveCopyWithImpl<GameEventOnIncomingMove>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameEventOnIncomingMove&&(identical(other.row, row) || other.row == row)&&(identical(other.column, column) || other.column == column)&&(identical(other.playerType, playerType) || other.playerType == playerType));
}


@override
int get hashCode => Object.hash(runtimeType,row,column,playerType);

@override
String toString() {
  return 'GameEvent.onIncomingMove(row: $row, column: $column, playerType: $playerType)';
}


}

/// @nodoc
abstract mixin class $GameEventOnIncomingMoveCopyWith<$Res> implements $GameEventCopyWith<$Res> {
  factory $GameEventOnIncomingMoveCopyWith(GameEventOnIncomingMove value, $Res Function(GameEventOnIncomingMove) _then) = _$GameEventOnIncomingMoveCopyWithImpl;
@useResult
$Res call({
 int row, int column, PlayerType playerType
});




}
/// @nodoc
class _$GameEventOnIncomingMoveCopyWithImpl<$Res>
    implements $GameEventOnIncomingMoveCopyWith<$Res> {
  _$GameEventOnIncomingMoveCopyWithImpl(this._self, this._then);

  final GameEventOnIncomingMove _self;
  final $Res Function(GameEventOnIncomingMove) _then;

/// Create a copy of GameEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? row = null,Object? column = null,Object? playerType = null,}) {
  return _then(GameEventOnIncomingMove(
row: null == row ? _self.row : row // ignore: cast_nullable_to_non_nullable
as int,column: null == column ? _self.column : column // ignore: cast_nullable_to_non_nullable
as int,playerType: null == playerType ? _self.playerType : playerType // ignore: cast_nullable_to_non_nullable
as PlayerType,
  ));
}


}

/// @nodoc


class GameEventOnConnectionLost implements GameEvent {
  const GameEventOnConnectionLost();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameEventOnConnectionLost);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GameEvent.onConnectionLost()';
}


}




/// @nodoc


class GameEventOnRoleAssigned implements GameEvent {
  const GameEventOnRoleAssigned({required this.myPlayerType});
  

 final  PlayerType myPlayerType;

/// Create a copy of GameEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GameEventOnRoleAssignedCopyWith<GameEventOnRoleAssigned> get copyWith => _$GameEventOnRoleAssignedCopyWithImpl<GameEventOnRoleAssigned>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameEventOnRoleAssigned&&(identical(other.myPlayerType, myPlayerType) || other.myPlayerType == myPlayerType));
}


@override
int get hashCode => Object.hash(runtimeType,myPlayerType);

@override
String toString() {
  return 'GameEvent.onRoleAssigned(myPlayerType: $myPlayerType)';
}


}

/// @nodoc
abstract mixin class $GameEventOnRoleAssignedCopyWith<$Res> implements $GameEventCopyWith<$Res> {
  factory $GameEventOnRoleAssignedCopyWith(GameEventOnRoleAssigned value, $Res Function(GameEventOnRoleAssigned) _then) = _$GameEventOnRoleAssignedCopyWithImpl;
@useResult
$Res call({
 PlayerType myPlayerType
});




}
/// @nodoc
class _$GameEventOnRoleAssignedCopyWithImpl<$Res>
    implements $GameEventOnRoleAssignedCopyWith<$Res> {
  _$GameEventOnRoleAssignedCopyWithImpl(this._self, this._then);

  final GameEventOnRoleAssigned _self;
  final $Res Function(GameEventOnRoleAssigned) _then;

/// Create a copy of GameEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? myPlayerType = null,}) {
  return _then(GameEventOnRoleAssigned(
myPlayerType: null == myPlayerType ? _self.myPlayerType : myPlayerType // ignore: cast_nullable_to_non_nullable
as PlayerType,
  ));
}


}

/// @nodoc
mixin _$GameState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GameState()';
}


}

/// @nodoc
class $GameStateCopyWith<$Res>  {
$GameStateCopyWith(GameState _, $Res Function(GameState) __);
}


/// Adds pattern-matching-related methods to [GameState].
extension GameStatePatterns on GameState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( GameStateInitializationPending value)?  initializationPending,TResult Function( GameStateInitializationError value)?  initializationError,TResult Function( GameStateView value)?  view,TResult Function( GameStateConnectionLost value)?  connectionLost,TResult Function( GameStateOpponentLeft value)?  opponentLeft,required TResult orElse(),}){
final _that = this;
switch (_that) {
case GameStateInitializationPending() when initializationPending != null:
return initializationPending(_that);case GameStateInitializationError() when initializationError != null:
return initializationError(_that);case GameStateView() when view != null:
return view(_that);case GameStateConnectionLost() when connectionLost != null:
return connectionLost(_that);case GameStateOpponentLeft() when opponentLeft != null:
return opponentLeft(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( GameStateInitializationPending value)  initializationPending,required TResult Function( GameStateInitializationError value)  initializationError,required TResult Function( GameStateView value)  view,required TResult Function( GameStateConnectionLost value)  connectionLost,required TResult Function( GameStateOpponentLeft value)  opponentLeft,}){
final _that = this;
switch (_that) {
case GameStateInitializationPending():
return initializationPending(_that);case GameStateInitializationError():
return initializationError(_that);case GameStateView():
return view(_that);case GameStateConnectionLost():
return connectionLost(_that);case GameStateOpponentLeft():
return opponentLeft(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( GameStateInitializationPending value)?  initializationPending,TResult? Function( GameStateInitializationError value)?  initializationError,TResult? Function( GameStateView value)?  view,TResult? Function( GameStateConnectionLost value)?  connectionLost,TResult? Function( GameStateOpponentLeft value)?  opponentLeft,}){
final _that = this;
switch (_that) {
case GameStateInitializationPending() when initializationPending != null:
return initializationPending(_that);case GameStateInitializationError() when initializationError != null:
return initializationError(_that);case GameStateView() when view != null:
return view(_that);case GameStateConnectionLost() when connectionLost != null:
return connectionLost(_that);case GameStateOpponentLeft() when opponentLeft != null:
return opponentLeft(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initializationPending,TResult Function( String message)?  initializationError,TResult Function( List<List<PlayerType?>> gameBoard,  PlayerType currentPlayer,  PlayerType playerType,  GameWinner gameWinner)?  view,TResult Function()?  connectionLost,TResult Function()?  opponentLeft,required TResult orElse(),}) {final _that = this;
switch (_that) {
case GameStateInitializationPending() when initializationPending != null:
return initializationPending();case GameStateInitializationError() when initializationError != null:
return initializationError(_that.message);case GameStateView() when view != null:
return view(_that.gameBoard,_that.currentPlayer,_that.playerType,_that.gameWinner);case GameStateConnectionLost() when connectionLost != null:
return connectionLost();case GameStateOpponentLeft() when opponentLeft != null:
return opponentLeft();case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initializationPending,required TResult Function( String message)  initializationError,required TResult Function( List<List<PlayerType?>> gameBoard,  PlayerType currentPlayer,  PlayerType playerType,  GameWinner gameWinner)  view,required TResult Function()  connectionLost,required TResult Function()  opponentLeft,}) {final _that = this;
switch (_that) {
case GameStateInitializationPending():
return initializationPending();case GameStateInitializationError():
return initializationError(_that.message);case GameStateView():
return view(_that.gameBoard,_that.currentPlayer,_that.playerType,_that.gameWinner);case GameStateConnectionLost():
return connectionLost();case GameStateOpponentLeft():
return opponentLeft();case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initializationPending,TResult? Function( String message)?  initializationError,TResult? Function( List<List<PlayerType?>> gameBoard,  PlayerType currentPlayer,  PlayerType playerType,  GameWinner gameWinner)?  view,TResult? Function()?  connectionLost,TResult? Function()?  opponentLeft,}) {final _that = this;
switch (_that) {
case GameStateInitializationPending() when initializationPending != null:
return initializationPending();case GameStateInitializationError() when initializationError != null:
return initializationError(_that.message);case GameStateView() when view != null:
return view(_that.gameBoard,_that.currentPlayer,_that.playerType,_that.gameWinner);case GameStateConnectionLost() when connectionLost != null:
return connectionLost();case GameStateOpponentLeft() when opponentLeft != null:
return opponentLeft();case _:
  return null;

}
}

}

/// @nodoc


class GameStateInitializationPending implements GameState {
  const GameStateInitializationPending();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameStateInitializationPending);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GameState.initializationPending()';
}


}




/// @nodoc


class GameStateInitializationError implements GameState {
  const GameStateInitializationError({required this.message});
  

 final  String message;

/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GameStateInitializationErrorCopyWith<GameStateInitializationError> get copyWith => _$GameStateInitializationErrorCopyWithImpl<GameStateInitializationError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameStateInitializationError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'GameState.initializationError(message: $message)';
}


}

/// @nodoc
abstract mixin class $GameStateInitializationErrorCopyWith<$Res> implements $GameStateCopyWith<$Res> {
  factory $GameStateInitializationErrorCopyWith(GameStateInitializationError value, $Res Function(GameStateInitializationError) _then) = _$GameStateInitializationErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$GameStateInitializationErrorCopyWithImpl<$Res>
    implements $GameStateInitializationErrorCopyWith<$Res> {
  _$GameStateInitializationErrorCopyWithImpl(this._self, this._then);

  final GameStateInitializationError _self;
  final $Res Function(GameStateInitializationError) _then;

/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(GameStateInitializationError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class GameStateView implements GameState {
  const GameStateView({required final  List<List<PlayerType?>> gameBoard, required this.currentPlayer, required this.playerType, required this.gameWinner}): _gameBoard = gameBoard;
  

 final  List<List<PlayerType?>> _gameBoard;
 List<List<PlayerType?>> get gameBoard {
  if (_gameBoard is EqualUnmodifiableListView) return _gameBoard;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_gameBoard);
}

 final  PlayerType currentPlayer;
 final  PlayerType playerType;
 final  GameWinner gameWinner;

/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GameStateViewCopyWith<GameStateView> get copyWith => _$GameStateViewCopyWithImpl<GameStateView>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameStateView&&const DeepCollectionEquality().equals(other._gameBoard, _gameBoard)&&(identical(other.currentPlayer, currentPlayer) || other.currentPlayer == currentPlayer)&&(identical(other.playerType, playerType) || other.playerType == playerType)&&(identical(other.gameWinner, gameWinner) || other.gameWinner == gameWinner));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_gameBoard),currentPlayer,playerType,gameWinner);

@override
String toString() {
  return 'GameState.view(gameBoard: $gameBoard, currentPlayer: $currentPlayer, playerType: $playerType, gameWinner: $gameWinner)';
}


}

/// @nodoc
abstract mixin class $GameStateViewCopyWith<$Res> implements $GameStateCopyWith<$Res> {
  factory $GameStateViewCopyWith(GameStateView value, $Res Function(GameStateView) _then) = _$GameStateViewCopyWithImpl;
@useResult
$Res call({
 List<List<PlayerType?>> gameBoard, PlayerType currentPlayer, PlayerType playerType, GameWinner gameWinner
});




}
/// @nodoc
class _$GameStateViewCopyWithImpl<$Res>
    implements $GameStateViewCopyWith<$Res> {
  _$GameStateViewCopyWithImpl(this._self, this._then);

  final GameStateView _self;
  final $Res Function(GameStateView) _then;

/// Create a copy of GameState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? gameBoard = null,Object? currentPlayer = null,Object? playerType = null,Object? gameWinner = null,}) {
  return _then(GameStateView(
gameBoard: null == gameBoard ? _self._gameBoard : gameBoard // ignore: cast_nullable_to_non_nullable
as List<List<PlayerType?>>,currentPlayer: null == currentPlayer ? _self.currentPlayer : currentPlayer // ignore: cast_nullable_to_non_nullable
as PlayerType,playerType: null == playerType ? _self.playerType : playerType // ignore: cast_nullable_to_non_nullable
as PlayerType,gameWinner: null == gameWinner ? _self.gameWinner : gameWinner // ignore: cast_nullable_to_non_nullable
as GameWinner,
  ));
}


}

/// @nodoc


class GameStateConnectionLost implements GameState {
  const GameStateConnectionLost();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameStateConnectionLost);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GameState.connectionLost()';
}


}




/// @nodoc


class GameStateOpponentLeft implements GameState {
  const GameStateOpponentLeft();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameStateOpponentLeft);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GameState.opponentLeft()';
}


}




// dart format on
