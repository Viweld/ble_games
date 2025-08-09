// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HomeEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent()';
}


}

/// @nodoc
class $HomeEventCopyWith<$Res>  {
$HomeEventCopyWith(HomeEvent _, $Res Function(HomeEvent) __);
}


/// Adds pattern-matching-related methods to [HomeEvent].
extension HomeEventPatterns on HomeEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( HomeEventOnInitializationRequested value)?  onInitializationRequested,TResult Function( HomeEventOnRefreshRequested value)?  onRefreshRequested,TResult Function( HomeEventOnPlayerSelected value)?  onPlayerSelected,TResult Function( HomeEventOnInvitePlayer value)?  onInvitePlayer,TResult Function( HomeEventOnCancelInvitation value)?  onCancelInvitation,TResult Function( HomeEventOnAcceptInvitation value)?  onAcceptInvitation,TResult Function( HomeEventOnRejectInvitation value)?  onRejectInvitation,TResult Function( HomeEventOnNicknameSaved value)?  onNicknameSaved,TResult Function( HomeEventOnViewStateChanged value)?  onViewStateChanged,TResult Function( HomeEventOnInvitationReceived value)?  onInvitationReceived,TResult Function( HomeEventOnInvitationRejected value)?  onInvitationRejected,TResult Function( HomeEventOnGameStarted value)?  onGameStarted,required TResult orElse(),}){
final _that = this;
switch (_that) {
case HomeEventOnInitializationRequested() when onInitializationRequested != null:
return onInitializationRequested(_that);case HomeEventOnRefreshRequested() when onRefreshRequested != null:
return onRefreshRequested(_that);case HomeEventOnPlayerSelected() when onPlayerSelected != null:
return onPlayerSelected(_that);case HomeEventOnInvitePlayer() when onInvitePlayer != null:
return onInvitePlayer(_that);case HomeEventOnCancelInvitation() when onCancelInvitation != null:
return onCancelInvitation(_that);case HomeEventOnAcceptInvitation() when onAcceptInvitation != null:
return onAcceptInvitation(_that);case HomeEventOnRejectInvitation() when onRejectInvitation != null:
return onRejectInvitation(_that);case HomeEventOnNicknameSaved() when onNicknameSaved != null:
return onNicknameSaved(_that);case HomeEventOnViewStateChanged() when onViewStateChanged != null:
return onViewStateChanged(_that);case HomeEventOnInvitationReceived() when onInvitationReceived != null:
return onInvitationReceived(_that);case HomeEventOnInvitationRejected() when onInvitationRejected != null:
return onInvitationRejected(_that);case HomeEventOnGameStarted() when onGameStarted != null:
return onGameStarted(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( HomeEventOnInitializationRequested value)  onInitializationRequested,required TResult Function( HomeEventOnRefreshRequested value)  onRefreshRequested,required TResult Function( HomeEventOnPlayerSelected value)  onPlayerSelected,required TResult Function( HomeEventOnInvitePlayer value)  onInvitePlayer,required TResult Function( HomeEventOnCancelInvitation value)  onCancelInvitation,required TResult Function( HomeEventOnAcceptInvitation value)  onAcceptInvitation,required TResult Function( HomeEventOnRejectInvitation value)  onRejectInvitation,required TResult Function( HomeEventOnNicknameSaved value)  onNicknameSaved,required TResult Function( HomeEventOnViewStateChanged value)  onViewStateChanged,required TResult Function( HomeEventOnInvitationReceived value)  onInvitationReceived,required TResult Function( HomeEventOnInvitationRejected value)  onInvitationRejected,required TResult Function( HomeEventOnGameStarted value)  onGameStarted,}){
final _that = this;
switch (_that) {
case HomeEventOnInitializationRequested():
return onInitializationRequested(_that);case HomeEventOnRefreshRequested():
return onRefreshRequested(_that);case HomeEventOnPlayerSelected():
return onPlayerSelected(_that);case HomeEventOnInvitePlayer():
return onInvitePlayer(_that);case HomeEventOnCancelInvitation():
return onCancelInvitation(_that);case HomeEventOnAcceptInvitation():
return onAcceptInvitation(_that);case HomeEventOnRejectInvitation():
return onRejectInvitation(_that);case HomeEventOnNicknameSaved():
return onNicknameSaved(_that);case HomeEventOnViewStateChanged():
return onViewStateChanged(_that);case HomeEventOnInvitationReceived():
return onInvitationReceived(_that);case HomeEventOnInvitationRejected():
return onInvitationRejected(_that);case HomeEventOnGameStarted():
return onGameStarted(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( HomeEventOnInitializationRequested value)?  onInitializationRequested,TResult? Function( HomeEventOnRefreshRequested value)?  onRefreshRequested,TResult? Function( HomeEventOnPlayerSelected value)?  onPlayerSelected,TResult? Function( HomeEventOnInvitePlayer value)?  onInvitePlayer,TResult? Function( HomeEventOnCancelInvitation value)?  onCancelInvitation,TResult? Function( HomeEventOnAcceptInvitation value)?  onAcceptInvitation,TResult? Function( HomeEventOnRejectInvitation value)?  onRejectInvitation,TResult? Function( HomeEventOnNicknameSaved value)?  onNicknameSaved,TResult? Function( HomeEventOnViewStateChanged value)?  onViewStateChanged,TResult? Function( HomeEventOnInvitationReceived value)?  onInvitationReceived,TResult? Function( HomeEventOnInvitationRejected value)?  onInvitationRejected,TResult? Function( HomeEventOnGameStarted value)?  onGameStarted,}){
final _that = this;
switch (_that) {
case HomeEventOnInitializationRequested() when onInitializationRequested != null:
return onInitializationRequested(_that);case HomeEventOnRefreshRequested() when onRefreshRequested != null:
return onRefreshRequested(_that);case HomeEventOnPlayerSelected() when onPlayerSelected != null:
return onPlayerSelected(_that);case HomeEventOnInvitePlayer() when onInvitePlayer != null:
return onInvitePlayer(_that);case HomeEventOnCancelInvitation() when onCancelInvitation != null:
return onCancelInvitation(_that);case HomeEventOnAcceptInvitation() when onAcceptInvitation != null:
return onAcceptInvitation(_that);case HomeEventOnRejectInvitation() when onRejectInvitation != null:
return onRejectInvitation(_that);case HomeEventOnNicknameSaved() when onNicknameSaved != null:
return onNicknameSaved(_that);case HomeEventOnViewStateChanged() when onViewStateChanged != null:
return onViewStateChanged(_that);case HomeEventOnInvitationReceived() when onInvitationReceived != null:
return onInvitationReceived(_that);case HomeEventOnInvitationRejected() when onInvitationRejected != null:
return onInvitationRejected(_that);case HomeEventOnGameStarted() when onGameStarted != null:
return onGameStarted(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  onInitializationRequested,TResult Function()?  onRefreshRequested,TResult Function( Player player)?  onPlayerSelected,TResult Function( Player player)?  onInvitePlayer,TResult Function()?  onCancelInvitation,TResult Function()?  onAcceptInvitation,TResult Function()?  onRejectInvitation,TResult Function( String nickname)?  onNicknameSaved,TResult Function()?  onViewStateChanged,TResult Function( Player invitingPlayer)?  onInvitationReceived,TResult Function( Player rejectedPlayer)?  onInvitationRejected,TResult Function( Player opponent)?  onGameStarted,required TResult orElse(),}) {final _that = this;
switch (_that) {
case HomeEventOnInitializationRequested() when onInitializationRequested != null:
return onInitializationRequested();case HomeEventOnRefreshRequested() when onRefreshRequested != null:
return onRefreshRequested();case HomeEventOnPlayerSelected() when onPlayerSelected != null:
return onPlayerSelected(_that.player);case HomeEventOnInvitePlayer() when onInvitePlayer != null:
return onInvitePlayer(_that.player);case HomeEventOnCancelInvitation() when onCancelInvitation != null:
return onCancelInvitation();case HomeEventOnAcceptInvitation() when onAcceptInvitation != null:
return onAcceptInvitation();case HomeEventOnRejectInvitation() when onRejectInvitation != null:
return onRejectInvitation();case HomeEventOnNicknameSaved() when onNicknameSaved != null:
return onNicknameSaved(_that.nickname);case HomeEventOnViewStateChanged() when onViewStateChanged != null:
return onViewStateChanged();case HomeEventOnInvitationReceived() when onInvitationReceived != null:
return onInvitationReceived(_that.invitingPlayer);case HomeEventOnInvitationRejected() when onInvitationRejected != null:
return onInvitationRejected(_that.rejectedPlayer);case HomeEventOnGameStarted() when onGameStarted != null:
return onGameStarted(_that.opponent);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  onInitializationRequested,required TResult Function()  onRefreshRequested,required TResult Function( Player player)  onPlayerSelected,required TResult Function( Player player)  onInvitePlayer,required TResult Function()  onCancelInvitation,required TResult Function()  onAcceptInvitation,required TResult Function()  onRejectInvitation,required TResult Function( String nickname)  onNicknameSaved,required TResult Function()  onViewStateChanged,required TResult Function( Player invitingPlayer)  onInvitationReceived,required TResult Function( Player rejectedPlayer)  onInvitationRejected,required TResult Function( Player opponent)  onGameStarted,}) {final _that = this;
switch (_that) {
case HomeEventOnInitializationRequested():
return onInitializationRequested();case HomeEventOnRefreshRequested():
return onRefreshRequested();case HomeEventOnPlayerSelected():
return onPlayerSelected(_that.player);case HomeEventOnInvitePlayer():
return onInvitePlayer(_that.player);case HomeEventOnCancelInvitation():
return onCancelInvitation();case HomeEventOnAcceptInvitation():
return onAcceptInvitation();case HomeEventOnRejectInvitation():
return onRejectInvitation();case HomeEventOnNicknameSaved():
return onNicknameSaved(_that.nickname);case HomeEventOnViewStateChanged():
return onViewStateChanged();case HomeEventOnInvitationReceived():
return onInvitationReceived(_that.invitingPlayer);case HomeEventOnInvitationRejected():
return onInvitationRejected(_that.rejectedPlayer);case HomeEventOnGameStarted():
return onGameStarted(_that.opponent);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  onInitializationRequested,TResult? Function()?  onRefreshRequested,TResult? Function( Player player)?  onPlayerSelected,TResult? Function( Player player)?  onInvitePlayer,TResult? Function()?  onCancelInvitation,TResult? Function()?  onAcceptInvitation,TResult? Function()?  onRejectInvitation,TResult? Function( String nickname)?  onNicknameSaved,TResult? Function()?  onViewStateChanged,TResult? Function( Player invitingPlayer)?  onInvitationReceived,TResult? Function( Player rejectedPlayer)?  onInvitationRejected,TResult? Function( Player opponent)?  onGameStarted,}) {final _that = this;
switch (_that) {
case HomeEventOnInitializationRequested() when onInitializationRequested != null:
return onInitializationRequested();case HomeEventOnRefreshRequested() when onRefreshRequested != null:
return onRefreshRequested();case HomeEventOnPlayerSelected() when onPlayerSelected != null:
return onPlayerSelected(_that.player);case HomeEventOnInvitePlayer() when onInvitePlayer != null:
return onInvitePlayer(_that.player);case HomeEventOnCancelInvitation() when onCancelInvitation != null:
return onCancelInvitation();case HomeEventOnAcceptInvitation() when onAcceptInvitation != null:
return onAcceptInvitation();case HomeEventOnRejectInvitation() when onRejectInvitation != null:
return onRejectInvitation();case HomeEventOnNicknameSaved() when onNicknameSaved != null:
return onNicknameSaved(_that.nickname);case HomeEventOnViewStateChanged() when onViewStateChanged != null:
return onViewStateChanged();case HomeEventOnInvitationReceived() when onInvitationReceived != null:
return onInvitationReceived(_that.invitingPlayer);case HomeEventOnInvitationRejected() when onInvitationRejected != null:
return onInvitationRejected(_that.rejectedPlayer);case HomeEventOnGameStarted() when onGameStarted != null:
return onGameStarted(_that.opponent);case _:
  return null;

}
}

}

/// @nodoc


class HomeEventOnInitializationRequested implements HomeEvent {
  const HomeEventOnInitializationRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeEventOnInitializationRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent.onInitializationRequested()';
}


}




/// @nodoc


class HomeEventOnRefreshRequested implements HomeEvent {
  const HomeEventOnRefreshRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeEventOnRefreshRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent.onRefreshRequested()';
}


}




/// @nodoc


class HomeEventOnPlayerSelected implements HomeEvent {
  const HomeEventOnPlayerSelected({required this.player});
  

 final  Player player;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeEventOnPlayerSelectedCopyWith<HomeEventOnPlayerSelected> get copyWith => _$HomeEventOnPlayerSelectedCopyWithImpl<HomeEventOnPlayerSelected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeEventOnPlayerSelected&&const DeepCollectionEquality().equals(other.player, player));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(player));

@override
String toString() {
  return 'HomeEvent.onPlayerSelected(player: $player)';
}


}

/// @nodoc
abstract mixin class $HomeEventOnPlayerSelectedCopyWith<$Res> implements $HomeEventCopyWith<$Res> {
  factory $HomeEventOnPlayerSelectedCopyWith(HomeEventOnPlayerSelected value, $Res Function(HomeEventOnPlayerSelected) _then) = _$HomeEventOnPlayerSelectedCopyWithImpl;
@useResult
$Res call({
 Player player
});




}
/// @nodoc
class _$HomeEventOnPlayerSelectedCopyWithImpl<$Res>
    implements $HomeEventOnPlayerSelectedCopyWith<$Res> {
  _$HomeEventOnPlayerSelectedCopyWithImpl(this._self, this._then);

  final HomeEventOnPlayerSelected _self;
  final $Res Function(HomeEventOnPlayerSelected) _then;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? player = freezed,}) {
  return _then(HomeEventOnPlayerSelected(
player: freezed == player ? _self.player : player // ignore: cast_nullable_to_non_nullable
as Player,
  ));
}


}

/// @nodoc


class HomeEventOnInvitePlayer implements HomeEvent {
  const HomeEventOnInvitePlayer({required this.player});
  

 final  Player player;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeEventOnInvitePlayerCopyWith<HomeEventOnInvitePlayer> get copyWith => _$HomeEventOnInvitePlayerCopyWithImpl<HomeEventOnInvitePlayer>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeEventOnInvitePlayer&&const DeepCollectionEquality().equals(other.player, player));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(player));

@override
String toString() {
  return 'HomeEvent.onInvitePlayer(player: $player)';
}


}

/// @nodoc
abstract mixin class $HomeEventOnInvitePlayerCopyWith<$Res> implements $HomeEventCopyWith<$Res> {
  factory $HomeEventOnInvitePlayerCopyWith(HomeEventOnInvitePlayer value, $Res Function(HomeEventOnInvitePlayer) _then) = _$HomeEventOnInvitePlayerCopyWithImpl;
@useResult
$Res call({
 Player player
});




}
/// @nodoc
class _$HomeEventOnInvitePlayerCopyWithImpl<$Res>
    implements $HomeEventOnInvitePlayerCopyWith<$Res> {
  _$HomeEventOnInvitePlayerCopyWithImpl(this._self, this._then);

  final HomeEventOnInvitePlayer _self;
  final $Res Function(HomeEventOnInvitePlayer) _then;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? player = freezed,}) {
  return _then(HomeEventOnInvitePlayer(
player: freezed == player ? _self.player : player // ignore: cast_nullable_to_non_nullable
as Player,
  ));
}


}

/// @nodoc


class HomeEventOnCancelInvitation implements HomeEvent {
  const HomeEventOnCancelInvitation();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeEventOnCancelInvitation);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent.onCancelInvitation()';
}


}




/// @nodoc


class HomeEventOnAcceptInvitation implements HomeEvent {
  const HomeEventOnAcceptInvitation();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeEventOnAcceptInvitation);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent.onAcceptInvitation()';
}


}




/// @nodoc


class HomeEventOnRejectInvitation implements HomeEvent {
  const HomeEventOnRejectInvitation();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeEventOnRejectInvitation);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent.onRejectInvitation()';
}


}




/// @nodoc


class HomeEventOnNicknameSaved implements HomeEvent {
  const HomeEventOnNicknameSaved({required this.nickname});
  

 final  String nickname;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeEventOnNicknameSavedCopyWith<HomeEventOnNicknameSaved> get copyWith => _$HomeEventOnNicknameSavedCopyWithImpl<HomeEventOnNicknameSaved>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeEventOnNicknameSaved&&(identical(other.nickname, nickname) || other.nickname == nickname));
}


@override
int get hashCode => Object.hash(runtimeType,nickname);

@override
String toString() {
  return 'HomeEvent.onNicknameSaved(nickname: $nickname)';
}


}

/// @nodoc
abstract mixin class $HomeEventOnNicknameSavedCopyWith<$Res> implements $HomeEventCopyWith<$Res> {
  factory $HomeEventOnNicknameSavedCopyWith(HomeEventOnNicknameSaved value, $Res Function(HomeEventOnNicknameSaved) _then) = _$HomeEventOnNicknameSavedCopyWithImpl;
@useResult
$Res call({
 String nickname
});




}
/// @nodoc
class _$HomeEventOnNicknameSavedCopyWithImpl<$Res>
    implements $HomeEventOnNicknameSavedCopyWith<$Res> {
  _$HomeEventOnNicknameSavedCopyWithImpl(this._self, this._then);

  final HomeEventOnNicknameSaved _self;
  final $Res Function(HomeEventOnNicknameSaved) _then;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? nickname = null,}) {
  return _then(HomeEventOnNicknameSaved(
nickname: null == nickname ? _self.nickname : nickname // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class HomeEventOnViewStateChanged implements HomeEvent {
  const HomeEventOnViewStateChanged();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeEventOnViewStateChanged);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent.onViewStateChanged()';
}


}




/// @nodoc


class HomeEventOnInvitationReceived implements HomeEvent {
  const HomeEventOnInvitationReceived({required this.invitingPlayer});
  

 final  Player invitingPlayer;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeEventOnInvitationReceivedCopyWith<HomeEventOnInvitationReceived> get copyWith => _$HomeEventOnInvitationReceivedCopyWithImpl<HomeEventOnInvitationReceived>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeEventOnInvitationReceived&&const DeepCollectionEquality().equals(other.invitingPlayer, invitingPlayer));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(invitingPlayer));

@override
String toString() {
  return 'HomeEvent.onInvitationReceived(invitingPlayer: $invitingPlayer)';
}


}

/// @nodoc
abstract mixin class $HomeEventOnInvitationReceivedCopyWith<$Res> implements $HomeEventCopyWith<$Res> {
  factory $HomeEventOnInvitationReceivedCopyWith(HomeEventOnInvitationReceived value, $Res Function(HomeEventOnInvitationReceived) _then) = _$HomeEventOnInvitationReceivedCopyWithImpl;
@useResult
$Res call({
 Player invitingPlayer
});




}
/// @nodoc
class _$HomeEventOnInvitationReceivedCopyWithImpl<$Res>
    implements $HomeEventOnInvitationReceivedCopyWith<$Res> {
  _$HomeEventOnInvitationReceivedCopyWithImpl(this._self, this._then);

  final HomeEventOnInvitationReceived _self;
  final $Res Function(HomeEventOnInvitationReceived) _then;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? invitingPlayer = freezed,}) {
  return _then(HomeEventOnInvitationReceived(
invitingPlayer: freezed == invitingPlayer ? _self.invitingPlayer : invitingPlayer // ignore: cast_nullable_to_non_nullable
as Player,
  ));
}


}

/// @nodoc


class HomeEventOnInvitationRejected implements HomeEvent {
  const HomeEventOnInvitationRejected({required this.rejectedPlayer});
  

 final  Player rejectedPlayer;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeEventOnInvitationRejectedCopyWith<HomeEventOnInvitationRejected> get copyWith => _$HomeEventOnInvitationRejectedCopyWithImpl<HomeEventOnInvitationRejected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeEventOnInvitationRejected&&const DeepCollectionEquality().equals(other.rejectedPlayer, rejectedPlayer));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(rejectedPlayer));

@override
String toString() {
  return 'HomeEvent.onInvitationRejected(rejectedPlayer: $rejectedPlayer)';
}


}

/// @nodoc
abstract mixin class $HomeEventOnInvitationRejectedCopyWith<$Res> implements $HomeEventCopyWith<$Res> {
  factory $HomeEventOnInvitationRejectedCopyWith(HomeEventOnInvitationRejected value, $Res Function(HomeEventOnInvitationRejected) _then) = _$HomeEventOnInvitationRejectedCopyWithImpl;
@useResult
$Res call({
 Player rejectedPlayer
});




}
/// @nodoc
class _$HomeEventOnInvitationRejectedCopyWithImpl<$Res>
    implements $HomeEventOnInvitationRejectedCopyWith<$Res> {
  _$HomeEventOnInvitationRejectedCopyWithImpl(this._self, this._then);

  final HomeEventOnInvitationRejected _self;
  final $Res Function(HomeEventOnInvitationRejected) _then;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? rejectedPlayer = freezed,}) {
  return _then(HomeEventOnInvitationRejected(
rejectedPlayer: freezed == rejectedPlayer ? _self.rejectedPlayer : rejectedPlayer // ignore: cast_nullable_to_non_nullable
as Player,
  ));
}


}

/// @nodoc


class HomeEventOnGameStarted implements HomeEvent {
  const HomeEventOnGameStarted({required this.opponent});
  

 final  Player opponent;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeEventOnGameStartedCopyWith<HomeEventOnGameStarted> get copyWith => _$HomeEventOnGameStartedCopyWithImpl<HomeEventOnGameStarted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeEventOnGameStarted&&const DeepCollectionEquality().equals(other.opponent, opponent));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(opponent));

@override
String toString() {
  return 'HomeEvent.onGameStarted(opponent: $opponent)';
}


}

/// @nodoc
abstract mixin class $HomeEventOnGameStartedCopyWith<$Res> implements $HomeEventCopyWith<$Res> {
  factory $HomeEventOnGameStartedCopyWith(HomeEventOnGameStarted value, $Res Function(HomeEventOnGameStarted) _then) = _$HomeEventOnGameStartedCopyWithImpl;
@useResult
$Res call({
 Player opponent
});




}
/// @nodoc
class _$HomeEventOnGameStartedCopyWithImpl<$Res>
    implements $HomeEventOnGameStartedCopyWith<$Res> {
  _$HomeEventOnGameStartedCopyWithImpl(this._self, this._then);

  final HomeEventOnGameStarted _self;
  final $Res Function(HomeEventOnGameStarted) _then;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? opponent = freezed,}) {
  return _then(HomeEventOnGameStarted(
opponent: freezed == opponent ? _self.opponent : opponent // ignore: cast_nullable_to_non_nullable
as Player,
  ));
}


}

/// @nodoc
mixin _$HomeState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeState()';
}


}

/// @nodoc
class $HomeStateCopyWith<$Res>  {
$HomeStateCopyWith(HomeState _, $Res Function(HomeState) __);
}


/// Adds pattern-matching-related methods to [HomeState].
extension HomeStatePatterns on HomeState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( HomeStateInitializationPending value)?  initializationPending,TResult Function( HomeStateInitializationError value)?  initializationError,TResult Function( HomeStateView value)?  view,TResult Function( HomeStateInvitationPending value)?  invitationPending,TResult Function( HomeStateInvitationReceived value)?  invitationReceived,TResult Function( HomeStateInvitationRejected value)?  invitationRejected,TResult Function( HomeStateGameStarted value)?  gameStarted,required TResult orElse(),}){
final _that = this;
switch (_that) {
case HomeStateInitializationPending() when initializationPending != null:
return initializationPending(_that);case HomeStateInitializationError() when initializationError != null:
return initializationError(_that);case HomeStateView() when view != null:
return view(_that);case HomeStateInvitationPending() when invitationPending != null:
return invitationPending(_that);case HomeStateInvitationReceived() when invitationReceived != null:
return invitationReceived(_that);case HomeStateInvitationRejected() when invitationRejected != null:
return invitationRejected(_that);case HomeStateGameStarted() when gameStarted != null:
return gameStarted(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( HomeStateInitializationPending value)  initializationPending,required TResult Function( HomeStateInitializationError value)  initializationError,required TResult Function( HomeStateView value)  view,required TResult Function( HomeStateInvitationPending value)  invitationPending,required TResult Function( HomeStateInvitationReceived value)  invitationReceived,required TResult Function( HomeStateInvitationRejected value)  invitationRejected,required TResult Function( HomeStateGameStarted value)  gameStarted,}){
final _that = this;
switch (_that) {
case HomeStateInitializationPending():
return initializationPending(_that);case HomeStateInitializationError():
return initializationError(_that);case HomeStateView():
return view(_that);case HomeStateInvitationPending():
return invitationPending(_that);case HomeStateInvitationReceived():
return invitationReceived(_that);case HomeStateInvitationRejected():
return invitationRejected(_that);case HomeStateGameStarted():
return gameStarted(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( HomeStateInitializationPending value)?  initializationPending,TResult? Function( HomeStateInitializationError value)?  initializationError,TResult? Function( HomeStateView value)?  view,TResult? Function( HomeStateInvitationPending value)?  invitationPending,TResult? Function( HomeStateInvitationReceived value)?  invitationReceived,TResult? Function( HomeStateInvitationRejected value)?  invitationRejected,TResult? Function( HomeStateGameStarted value)?  gameStarted,}){
final _that = this;
switch (_that) {
case HomeStateInitializationPending() when initializationPending != null:
return initializationPending(_that);case HomeStateInitializationError() when initializationError != null:
return initializationError(_that);case HomeStateView() when view != null:
return view(_that);case HomeStateInvitationPending() when invitationPending != null:
return invitationPending(_that);case HomeStateInvitationReceived() when invitationReceived != null:
return invitationReceived(_that);case HomeStateInvitationRejected() when invitationRejected != null:
return invitationRejected(_that);case HomeStateGameStarted() when gameStarted != null:
return gameStarted(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initializationPending,TResult Function( String message)?  initializationError,TResult Function( List<Player> players,  Player? selectedPlayer,  bool isFirstLaunch)?  view,TResult Function( Player invitedPlayer)?  invitationPending,TResult Function( Player invitingPlayer)?  invitationReceived,TResult Function( Player rejectedPlayer)?  invitationRejected,TResult Function( Player opponent)?  gameStarted,required TResult orElse(),}) {final _that = this;
switch (_that) {
case HomeStateInitializationPending() when initializationPending != null:
return initializationPending();case HomeStateInitializationError() when initializationError != null:
return initializationError(_that.message);case HomeStateView() when view != null:
return view(_that.players,_that.selectedPlayer,_that.isFirstLaunch);case HomeStateInvitationPending() when invitationPending != null:
return invitationPending(_that.invitedPlayer);case HomeStateInvitationReceived() when invitationReceived != null:
return invitationReceived(_that.invitingPlayer);case HomeStateInvitationRejected() when invitationRejected != null:
return invitationRejected(_that.rejectedPlayer);case HomeStateGameStarted() when gameStarted != null:
return gameStarted(_that.opponent);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initializationPending,required TResult Function( String message)  initializationError,required TResult Function( List<Player> players,  Player? selectedPlayer,  bool isFirstLaunch)  view,required TResult Function( Player invitedPlayer)  invitationPending,required TResult Function( Player invitingPlayer)  invitationReceived,required TResult Function( Player rejectedPlayer)  invitationRejected,required TResult Function( Player opponent)  gameStarted,}) {final _that = this;
switch (_that) {
case HomeStateInitializationPending():
return initializationPending();case HomeStateInitializationError():
return initializationError(_that.message);case HomeStateView():
return view(_that.players,_that.selectedPlayer,_that.isFirstLaunch);case HomeStateInvitationPending():
return invitationPending(_that.invitedPlayer);case HomeStateInvitationReceived():
return invitationReceived(_that.invitingPlayer);case HomeStateInvitationRejected():
return invitationRejected(_that.rejectedPlayer);case HomeStateGameStarted():
return gameStarted(_that.opponent);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initializationPending,TResult? Function( String message)?  initializationError,TResult? Function( List<Player> players,  Player? selectedPlayer,  bool isFirstLaunch)?  view,TResult? Function( Player invitedPlayer)?  invitationPending,TResult? Function( Player invitingPlayer)?  invitationReceived,TResult? Function( Player rejectedPlayer)?  invitationRejected,TResult? Function( Player opponent)?  gameStarted,}) {final _that = this;
switch (_that) {
case HomeStateInitializationPending() when initializationPending != null:
return initializationPending();case HomeStateInitializationError() when initializationError != null:
return initializationError(_that.message);case HomeStateView() when view != null:
return view(_that.players,_that.selectedPlayer,_that.isFirstLaunch);case HomeStateInvitationPending() when invitationPending != null:
return invitationPending(_that.invitedPlayer);case HomeStateInvitationReceived() when invitationReceived != null:
return invitationReceived(_that.invitingPlayer);case HomeStateInvitationRejected() when invitationRejected != null:
return invitationRejected(_that.rejectedPlayer);case HomeStateGameStarted() when gameStarted != null:
return gameStarted(_that.opponent);case _:
  return null;

}
}

}

/// @nodoc


class HomeStateInitializationPending implements HomeState {
  const HomeStateInitializationPending();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeStateInitializationPending);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeState.initializationPending()';
}


}




/// @nodoc


class HomeStateInitializationError implements HomeState {
  const HomeStateInitializationError({required this.message});
  

 final  String message;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeStateInitializationErrorCopyWith<HomeStateInitializationError> get copyWith => _$HomeStateInitializationErrorCopyWithImpl<HomeStateInitializationError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeStateInitializationError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'HomeState.initializationError(message: $message)';
}


}

/// @nodoc
abstract mixin class $HomeStateInitializationErrorCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory $HomeStateInitializationErrorCopyWith(HomeStateInitializationError value, $Res Function(HomeStateInitializationError) _then) = _$HomeStateInitializationErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$HomeStateInitializationErrorCopyWithImpl<$Res>
    implements $HomeStateInitializationErrorCopyWith<$Res> {
  _$HomeStateInitializationErrorCopyWithImpl(this._self, this._then);

  final HomeStateInitializationError _self;
  final $Res Function(HomeStateInitializationError) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(HomeStateInitializationError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class HomeStateView implements HomeState {
  const HomeStateView({required final  List<Player> players, this.selectedPlayer, required this.isFirstLaunch}): _players = players;
  

 final  List<Player> _players;
 List<Player> get players {
  if (_players is EqualUnmodifiableListView) return _players;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_players);
}

 final  Player? selectedPlayer;
 final  bool isFirstLaunch;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeStateViewCopyWith<HomeStateView> get copyWith => _$HomeStateViewCopyWithImpl<HomeStateView>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeStateView&&const DeepCollectionEquality().equals(other._players, _players)&&const DeepCollectionEquality().equals(other.selectedPlayer, selectedPlayer)&&(identical(other.isFirstLaunch, isFirstLaunch) || other.isFirstLaunch == isFirstLaunch));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_players),const DeepCollectionEquality().hash(selectedPlayer),isFirstLaunch);

@override
String toString() {
  return 'HomeState.view(players: $players, selectedPlayer: $selectedPlayer, isFirstLaunch: $isFirstLaunch)';
}


}

/// @nodoc
abstract mixin class $HomeStateViewCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory $HomeStateViewCopyWith(HomeStateView value, $Res Function(HomeStateView) _then) = _$HomeStateViewCopyWithImpl;
@useResult
$Res call({
 List<Player> players, Player? selectedPlayer, bool isFirstLaunch
});




}
/// @nodoc
class _$HomeStateViewCopyWithImpl<$Res>
    implements $HomeStateViewCopyWith<$Res> {
  _$HomeStateViewCopyWithImpl(this._self, this._then);

  final HomeStateView _self;
  final $Res Function(HomeStateView) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? players = null,Object? selectedPlayer = freezed,Object? isFirstLaunch = null,}) {
  return _then(HomeStateView(
players: null == players ? _self._players : players // ignore: cast_nullable_to_non_nullable
as List<Player>,selectedPlayer: freezed == selectedPlayer ? _self.selectedPlayer : selectedPlayer // ignore: cast_nullable_to_non_nullable
as Player?,isFirstLaunch: null == isFirstLaunch ? _self.isFirstLaunch : isFirstLaunch // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class HomeStateInvitationPending implements HomeState {
  const HomeStateInvitationPending({required this.invitedPlayer});
  

 final  Player invitedPlayer;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeStateInvitationPendingCopyWith<HomeStateInvitationPending> get copyWith => _$HomeStateInvitationPendingCopyWithImpl<HomeStateInvitationPending>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeStateInvitationPending&&const DeepCollectionEquality().equals(other.invitedPlayer, invitedPlayer));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(invitedPlayer));

@override
String toString() {
  return 'HomeState.invitationPending(invitedPlayer: $invitedPlayer)';
}


}

/// @nodoc
abstract mixin class $HomeStateInvitationPendingCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory $HomeStateInvitationPendingCopyWith(HomeStateInvitationPending value, $Res Function(HomeStateInvitationPending) _then) = _$HomeStateInvitationPendingCopyWithImpl;
@useResult
$Res call({
 Player invitedPlayer
});




}
/// @nodoc
class _$HomeStateInvitationPendingCopyWithImpl<$Res>
    implements $HomeStateInvitationPendingCopyWith<$Res> {
  _$HomeStateInvitationPendingCopyWithImpl(this._self, this._then);

  final HomeStateInvitationPending _self;
  final $Res Function(HomeStateInvitationPending) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? invitedPlayer = freezed,}) {
  return _then(HomeStateInvitationPending(
invitedPlayer: freezed == invitedPlayer ? _self.invitedPlayer : invitedPlayer // ignore: cast_nullable_to_non_nullable
as Player,
  ));
}


}

/// @nodoc


class HomeStateInvitationReceived implements HomeState {
  const HomeStateInvitationReceived({required this.invitingPlayer});
  

 final  Player invitingPlayer;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeStateInvitationReceivedCopyWith<HomeStateInvitationReceived> get copyWith => _$HomeStateInvitationReceivedCopyWithImpl<HomeStateInvitationReceived>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeStateInvitationReceived&&const DeepCollectionEquality().equals(other.invitingPlayer, invitingPlayer));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(invitingPlayer));

@override
String toString() {
  return 'HomeState.invitationReceived(invitingPlayer: $invitingPlayer)';
}


}

/// @nodoc
abstract mixin class $HomeStateInvitationReceivedCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory $HomeStateInvitationReceivedCopyWith(HomeStateInvitationReceived value, $Res Function(HomeStateInvitationReceived) _then) = _$HomeStateInvitationReceivedCopyWithImpl;
@useResult
$Res call({
 Player invitingPlayer
});




}
/// @nodoc
class _$HomeStateInvitationReceivedCopyWithImpl<$Res>
    implements $HomeStateInvitationReceivedCopyWith<$Res> {
  _$HomeStateInvitationReceivedCopyWithImpl(this._self, this._then);

  final HomeStateInvitationReceived _self;
  final $Res Function(HomeStateInvitationReceived) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? invitingPlayer = freezed,}) {
  return _then(HomeStateInvitationReceived(
invitingPlayer: freezed == invitingPlayer ? _self.invitingPlayer : invitingPlayer // ignore: cast_nullable_to_non_nullable
as Player,
  ));
}


}

/// @nodoc


class HomeStateInvitationRejected implements HomeState {
  const HomeStateInvitationRejected({required this.rejectedPlayer});
  

 final  Player rejectedPlayer;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeStateInvitationRejectedCopyWith<HomeStateInvitationRejected> get copyWith => _$HomeStateInvitationRejectedCopyWithImpl<HomeStateInvitationRejected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeStateInvitationRejected&&const DeepCollectionEquality().equals(other.rejectedPlayer, rejectedPlayer));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(rejectedPlayer));

@override
String toString() {
  return 'HomeState.invitationRejected(rejectedPlayer: $rejectedPlayer)';
}


}

/// @nodoc
abstract mixin class $HomeStateInvitationRejectedCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory $HomeStateInvitationRejectedCopyWith(HomeStateInvitationRejected value, $Res Function(HomeStateInvitationRejected) _then) = _$HomeStateInvitationRejectedCopyWithImpl;
@useResult
$Res call({
 Player rejectedPlayer
});




}
/// @nodoc
class _$HomeStateInvitationRejectedCopyWithImpl<$Res>
    implements $HomeStateInvitationRejectedCopyWith<$Res> {
  _$HomeStateInvitationRejectedCopyWithImpl(this._self, this._then);

  final HomeStateInvitationRejected _self;
  final $Res Function(HomeStateInvitationRejected) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? rejectedPlayer = freezed,}) {
  return _then(HomeStateInvitationRejected(
rejectedPlayer: freezed == rejectedPlayer ? _self.rejectedPlayer : rejectedPlayer // ignore: cast_nullable_to_non_nullable
as Player,
  ));
}


}

/// @nodoc


class HomeStateGameStarted implements HomeState {
  const HomeStateGameStarted({required this.opponent});
  

 final  Player opponent;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeStateGameStartedCopyWith<HomeStateGameStarted> get copyWith => _$HomeStateGameStartedCopyWithImpl<HomeStateGameStarted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeStateGameStarted&&const DeepCollectionEquality().equals(other.opponent, opponent));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(opponent));

@override
String toString() {
  return 'HomeState.gameStarted(opponent: $opponent)';
}


}

/// @nodoc
abstract mixin class $HomeStateGameStartedCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory $HomeStateGameStartedCopyWith(HomeStateGameStarted value, $Res Function(HomeStateGameStarted) _then) = _$HomeStateGameStartedCopyWithImpl;
@useResult
$Res call({
 Player opponent
});




}
/// @nodoc
class _$HomeStateGameStartedCopyWithImpl<$Res>
    implements $HomeStateGameStartedCopyWith<$Res> {
  _$HomeStateGameStartedCopyWithImpl(this._self, this._then);

  final HomeStateGameStarted _self;
  final $Res Function(HomeStateGameStarted) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? opponent = freezed,}) {
  return _then(HomeStateGameStarted(
opponent: freezed == opponent ? _self.opponent : opponent // ignore: cast_nullable_to_non_nullable
as Player,
  ));
}


}

// dart format on
