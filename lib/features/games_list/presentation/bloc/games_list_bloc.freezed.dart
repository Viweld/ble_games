// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'games_list_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$GamesListEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GamesListEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GamesListEvent()';
}


}

/// @nodoc
class $GamesListEventCopyWith<$Res>  {
$GamesListEventCopyWith(GamesListEvent _, $Res Function(GamesListEvent) __);
}


/// Adds pattern-matching-related methods to [GamesListEvent].
extension GamesListEventPatterns on GamesListEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( GamesListEventOnInitializationRequested value)?  onInitializationRequested,TResult Function( GamesListEventOnGameSelected value)?  onGameSelected,TResult Function( GamesListEventOnGameStart value)?  onGameStart,TResult Function( GamesListEventOnBackPressed value)?  onBackPressed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case GamesListEventOnInitializationRequested() when onInitializationRequested != null:
return onInitializationRequested(_that);case GamesListEventOnGameSelected() when onGameSelected != null:
return onGameSelected(_that);case GamesListEventOnGameStart() when onGameStart != null:
return onGameStart(_that);case GamesListEventOnBackPressed() when onBackPressed != null:
return onBackPressed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( GamesListEventOnInitializationRequested value)  onInitializationRequested,required TResult Function( GamesListEventOnGameSelected value)  onGameSelected,required TResult Function( GamesListEventOnGameStart value)  onGameStart,required TResult Function( GamesListEventOnBackPressed value)  onBackPressed,}){
final _that = this;
switch (_that) {
case GamesListEventOnInitializationRequested():
return onInitializationRequested(_that);case GamesListEventOnGameSelected():
return onGameSelected(_that);case GamesListEventOnGameStart():
return onGameStart(_that);case GamesListEventOnBackPressed():
return onBackPressed(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( GamesListEventOnInitializationRequested value)?  onInitializationRequested,TResult? Function( GamesListEventOnGameSelected value)?  onGameSelected,TResult? Function( GamesListEventOnGameStart value)?  onGameStart,TResult? Function( GamesListEventOnBackPressed value)?  onBackPressed,}){
final _that = this;
switch (_that) {
case GamesListEventOnInitializationRequested() when onInitializationRequested != null:
return onInitializationRequested(_that);case GamesListEventOnGameSelected() when onGameSelected != null:
return onGameSelected(_that);case GamesListEventOnGameStart() when onGameStart != null:
return onGameStart(_that);case GamesListEventOnBackPressed() when onBackPressed != null:
return onBackPressed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  onInitializationRequested,TResult Function( Game game)?  onGameSelected,TResult Function()?  onGameStart,TResult Function()?  onBackPressed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case GamesListEventOnInitializationRequested() when onInitializationRequested != null:
return onInitializationRequested();case GamesListEventOnGameSelected() when onGameSelected != null:
return onGameSelected(_that.game);case GamesListEventOnGameStart() when onGameStart != null:
return onGameStart();case GamesListEventOnBackPressed() when onBackPressed != null:
return onBackPressed();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  onInitializationRequested,required TResult Function( Game game)  onGameSelected,required TResult Function()  onGameStart,required TResult Function()  onBackPressed,}) {final _that = this;
switch (_that) {
case GamesListEventOnInitializationRequested():
return onInitializationRequested();case GamesListEventOnGameSelected():
return onGameSelected(_that.game);case GamesListEventOnGameStart():
return onGameStart();case GamesListEventOnBackPressed():
return onBackPressed();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  onInitializationRequested,TResult? Function( Game game)?  onGameSelected,TResult? Function()?  onGameStart,TResult? Function()?  onBackPressed,}) {final _that = this;
switch (_that) {
case GamesListEventOnInitializationRequested() when onInitializationRequested != null:
return onInitializationRequested();case GamesListEventOnGameSelected() when onGameSelected != null:
return onGameSelected(_that.game);case GamesListEventOnGameStart() when onGameStart != null:
return onGameStart();case GamesListEventOnBackPressed() when onBackPressed != null:
return onBackPressed();case _:
  return null;

}
}

}

/// @nodoc


class GamesListEventOnInitializationRequested implements GamesListEvent {
  const GamesListEventOnInitializationRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GamesListEventOnInitializationRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GamesListEvent.onInitializationRequested()';
}


}




/// @nodoc


class GamesListEventOnGameSelected implements GamesListEvent {
  const GamesListEventOnGameSelected({required this.game});
  

 final  Game game;

/// Create a copy of GamesListEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GamesListEventOnGameSelectedCopyWith<GamesListEventOnGameSelected> get copyWith => _$GamesListEventOnGameSelectedCopyWithImpl<GamesListEventOnGameSelected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GamesListEventOnGameSelected&&(identical(other.game, game) || other.game == game));
}


@override
int get hashCode => Object.hash(runtimeType,game);

@override
String toString() {
  return 'GamesListEvent.onGameSelected(game: $game)';
}


}

/// @nodoc
abstract mixin class $GamesListEventOnGameSelectedCopyWith<$Res> implements $GamesListEventCopyWith<$Res> {
  factory $GamesListEventOnGameSelectedCopyWith(GamesListEventOnGameSelected value, $Res Function(GamesListEventOnGameSelected) _then) = _$GamesListEventOnGameSelectedCopyWithImpl;
@useResult
$Res call({
 Game game
});




}
/// @nodoc
class _$GamesListEventOnGameSelectedCopyWithImpl<$Res>
    implements $GamesListEventOnGameSelectedCopyWith<$Res> {
  _$GamesListEventOnGameSelectedCopyWithImpl(this._self, this._then);

  final GamesListEventOnGameSelected _self;
  final $Res Function(GamesListEventOnGameSelected) _then;

/// Create a copy of GamesListEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? game = null,}) {
  return _then(GamesListEventOnGameSelected(
game: null == game ? _self.game : game // ignore: cast_nullable_to_non_nullable
as Game,
  ));
}


}

/// @nodoc


class GamesListEventOnGameStart implements GamesListEvent {
  const GamesListEventOnGameStart();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GamesListEventOnGameStart);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GamesListEvent.onGameStart()';
}


}




/// @nodoc


class GamesListEventOnBackPressed implements GamesListEvent {
  const GamesListEventOnBackPressed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GamesListEventOnBackPressed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GamesListEvent.onBackPressed()';
}


}




/// @nodoc
mixin _$GamesListState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GamesListState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GamesListState()';
}


}

/// @nodoc
class $GamesListStateCopyWith<$Res>  {
$GamesListStateCopyWith(GamesListState _, $Res Function(GamesListState) __);
}


/// Adds pattern-matching-related methods to [GamesListState].
extension GamesListStatePatterns on GamesListState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( GamesListStateInitializationPending value)?  initializationPending,TResult Function( GamesListStateInitializationError value)?  initializationError,TResult Function( GamesListStateView value)?  view,TResult Function( GamesListStateGameStarting value)?  gameStarting,required TResult orElse(),}){
final _that = this;
switch (_that) {
case GamesListStateInitializationPending() when initializationPending != null:
return initializationPending(_that);case GamesListStateInitializationError() when initializationError != null:
return initializationError(_that);case GamesListStateView() when view != null:
return view(_that);case GamesListStateGameStarting() when gameStarting != null:
return gameStarting(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( GamesListStateInitializationPending value)  initializationPending,required TResult Function( GamesListStateInitializationError value)  initializationError,required TResult Function( GamesListStateView value)  view,required TResult Function( GamesListStateGameStarting value)  gameStarting,}){
final _that = this;
switch (_that) {
case GamesListStateInitializationPending():
return initializationPending(_that);case GamesListStateInitializationError():
return initializationError(_that);case GamesListStateView():
return view(_that);case GamesListStateGameStarting():
return gameStarting(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( GamesListStateInitializationPending value)?  initializationPending,TResult? Function( GamesListStateInitializationError value)?  initializationError,TResult? Function( GamesListStateView value)?  view,TResult? Function( GamesListStateGameStarting value)?  gameStarting,}){
final _that = this;
switch (_that) {
case GamesListStateInitializationPending() when initializationPending != null:
return initializationPending(_that);case GamesListStateInitializationError() when initializationError != null:
return initializationError(_that);case GamesListStateView() when view != null:
return view(_that);case GamesListStateGameStarting() when gameStarting != null:
return gameStarting(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initializationPending,TResult Function( String message)?  initializationError,TResult Function( List<Game> games,  Game? selectedGame)?  view,TResult Function( Game game)?  gameStarting,required TResult orElse(),}) {final _that = this;
switch (_that) {
case GamesListStateInitializationPending() when initializationPending != null:
return initializationPending();case GamesListStateInitializationError() when initializationError != null:
return initializationError(_that.message);case GamesListStateView() when view != null:
return view(_that.games,_that.selectedGame);case GamesListStateGameStarting() when gameStarting != null:
return gameStarting(_that.game);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initializationPending,required TResult Function( String message)  initializationError,required TResult Function( List<Game> games,  Game? selectedGame)  view,required TResult Function( Game game)  gameStarting,}) {final _that = this;
switch (_that) {
case GamesListStateInitializationPending():
return initializationPending();case GamesListStateInitializationError():
return initializationError(_that.message);case GamesListStateView():
return view(_that.games,_that.selectedGame);case GamesListStateGameStarting():
return gameStarting(_that.game);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initializationPending,TResult? Function( String message)?  initializationError,TResult? Function( List<Game> games,  Game? selectedGame)?  view,TResult? Function( Game game)?  gameStarting,}) {final _that = this;
switch (_that) {
case GamesListStateInitializationPending() when initializationPending != null:
return initializationPending();case GamesListStateInitializationError() when initializationError != null:
return initializationError(_that.message);case GamesListStateView() when view != null:
return view(_that.games,_that.selectedGame);case GamesListStateGameStarting() when gameStarting != null:
return gameStarting(_that.game);case _:
  return null;

}
}

}

/// @nodoc


class GamesListStateInitializationPending implements GamesListState {
  const GamesListStateInitializationPending();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GamesListStateInitializationPending);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'GamesListState.initializationPending()';
}


}




/// @nodoc


class GamesListStateInitializationError implements GamesListState {
  const GamesListStateInitializationError({required this.message});
  

 final  String message;

/// Create a copy of GamesListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GamesListStateInitializationErrorCopyWith<GamesListStateInitializationError> get copyWith => _$GamesListStateInitializationErrorCopyWithImpl<GamesListStateInitializationError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GamesListStateInitializationError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'GamesListState.initializationError(message: $message)';
}


}

/// @nodoc
abstract mixin class $GamesListStateInitializationErrorCopyWith<$Res> implements $GamesListStateCopyWith<$Res> {
  factory $GamesListStateInitializationErrorCopyWith(GamesListStateInitializationError value, $Res Function(GamesListStateInitializationError) _then) = _$GamesListStateInitializationErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$GamesListStateInitializationErrorCopyWithImpl<$Res>
    implements $GamesListStateInitializationErrorCopyWith<$Res> {
  _$GamesListStateInitializationErrorCopyWithImpl(this._self, this._then);

  final GamesListStateInitializationError _self;
  final $Res Function(GamesListStateInitializationError) _then;

/// Create a copy of GamesListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(GamesListStateInitializationError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class GamesListStateView implements GamesListState {
  const GamesListStateView({required final  List<Game> games, this.selectedGame}): _games = games;
  

 final  List<Game> _games;
 List<Game> get games {
  if (_games is EqualUnmodifiableListView) return _games;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_games);
}

 final  Game? selectedGame;

/// Create a copy of GamesListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GamesListStateViewCopyWith<GamesListStateView> get copyWith => _$GamesListStateViewCopyWithImpl<GamesListStateView>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GamesListStateView&&const DeepCollectionEquality().equals(other._games, _games)&&(identical(other.selectedGame, selectedGame) || other.selectedGame == selectedGame));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_games),selectedGame);

@override
String toString() {
  return 'GamesListState.view(games: $games, selectedGame: $selectedGame)';
}


}

/// @nodoc
abstract mixin class $GamesListStateViewCopyWith<$Res> implements $GamesListStateCopyWith<$Res> {
  factory $GamesListStateViewCopyWith(GamesListStateView value, $Res Function(GamesListStateView) _then) = _$GamesListStateViewCopyWithImpl;
@useResult
$Res call({
 List<Game> games, Game? selectedGame
});




}
/// @nodoc
class _$GamesListStateViewCopyWithImpl<$Res>
    implements $GamesListStateViewCopyWith<$Res> {
  _$GamesListStateViewCopyWithImpl(this._self, this._then);

  final GamesListStateView _self;
  final $Res Function(GamesListStateView) _then;

/// Create a copy of GamesListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? games = null,Object? selectedGame = freezed,}) {
  return _then(GamesListStateView(
games: null == games ? _self._games : games // ignore: cast_nullable_to_non_nullable
as List<Game>,selectedGame: freezed == selectedGame ? _self.selectedGame : selectedGame // ignore: cast_nullable_to_non_nullable
as Game?,
  ));
}


}

/// @nodoc


class GamesListStateGameStarting implements GamesListState {
  const GamesListStateGameStarting({required this.game});
  

 final  Game game;

/// Create a copy of GamesListState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GamesListStateGameStartingCopyWith<GamesListStateGameStarting> get copyWith => _$GamesListStateGameStartingCopyWithImpl<GamesListStateGameStarting>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GamesListStateGameStarting&&(identical(other.game, game) || other.game == game));
}


@override
int get hashCode => Object.hash(runtimeType,game);

@override
String toString() {
  return 'GamesListState.gameStarting(game: $game)';
}


}

/// @nodoc
abstract mixin class $GamesListStateGameStartingCopyWith<$Res> implements $GamesListStateCopyWith<$Res> {
  factory $GamesListStateGameStartingCopyWith(GamesListStateGameStarting value, $Res Function(GamesListStateGameStarting) _then) = _$GamesListStateGameStartingCopyWithImpl;
@useResult
$Res call({
 Game game
});




}
/// @nodoc
class _$GamesListStateGameStartingCopyWithImpl<$Res>
    implements $GamesListStateGameStartingCopyWith<$Res> {
  _$GamesListStateGameStartingCopyWithImpl(this._self, this._then);

  final GamesListStateGameStarting _self;
  final $Res Function(GamesListStateGameStarting) _then;

/// Create a copy of GamesListState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? game = null,}) {
  return _then(GamesListStateGameStarting(
game: null == game ? _self.game : game // ignore: cast_nullable_to_non_nullable
as Game,
  ));
}


}

// dart format on
