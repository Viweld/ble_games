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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( HomeEventOnInitializationRequested value)?  onInitializationRequested,TResult Function( HomeEventOnInvite value)?  onInvite,TResult Function( HomeEventOnCancelInvitation value)?  onCancelInvitation,TResult Function( HomeEventOnAcceptInvitation value)?  onAcceptInvitation,TResult Function( HomeEventOnRejectInvitation value)?  onRejectInvitation,TResult Function( HomeEventOnNicknameSaved value)?  onNicknameSaved,TResult Function( HomeEventOnInvitationReceived value)?  onInvitationReceived,TResult Function( HomeEventOnInvitationRejected value)?  onInvitationRejected,TResult Function( HomeEventOnConnected value)?  onConnected,required TResult orElse(),}){
final _that = this;
switch (_that) {
case HomeEventOnInitializationRequested() when onInitializationRequested != null:
return onInitializationRequested(_that);case HomeEventOnInvite() when onInvite != null:
return onInvite(_that);case HomeEventOnCancelInvitation() when onCancelInvitation != null:
return onCancelInvitation(_that);case HomeEventOnAcceptInvitation() when onAcceptInvitation != null:
return onAcceptInvitation(_that);case HomeEventOnRejectInvitation() when onRejectInvitation != null:
return onRejectInvitation(_that);case HomeEventOnNicknameSaved() when onNicknameSaved != null:
return onNicknameSaved(_that);case HomeEventOnInvitationReceived() when onInvitationReceived != null:
return onInvitationReceived(_that);case HomeEventOnInvitationRejected() when onInvitationRejected != null:
return onInvitationRejected(_that);case HomeEventOnConnected() when onConnected != null:
return onConnected(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( HomeEventOnInitializationRequested value)  onInitializationRequested,required TResult Function( HomeEventOnInvite value)  onInvite,required TResult Function( HomeEventOnCancelInvitation value)  onCancelInvitation,required TResult Function( HomeEventOnAcceptInvitation value)  onAcceptInvitation,required TResult Function( HomeEventOnRejectInvitation value)  onRejectInvitation,required TResult Function( HomeEventOnNicknameSaved value)  onNicknameSaved,required TResult Function( HomeEventOnInvitationReceived value)  onInvitationReceived,required TResult Function( HomeEventOnInvitationRejected value)  onInvitationRejected,required TResult Function( HomeEventOnConnected value)  onConnected,}){
final _that = this;
switch (_that) {
case HomeEventOnInitializationRequested():
return onInitializationRequested(_that);case HomeEventOnInvite():
return onInvite(_that);case HomeEventOnCancelInvitation():
return onCancelInvitation(_that);case HomeEventOnAcceptInvitation():
return onAcceptInvitation(_that);case HomeEventOnRejectInvitation():
return onRejectInvitation(_that);case HomeEventOnNicknameSaved():
return onNicknameSaved(_that);case HomeEventOnInvitationReceived():
return onInvitationReceived(_that);case HomeEventOnInvitationRejected():
return onInvitationRejected(_that);case HomeEventOnConnected():
return onConnected(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( HomeEventOnInitializationRequested value)?  onInitializationRequested,TResult? Function( HomeEventOnInvite value)?  onInvite,TResult? Function( HomeEventOnCancelInvitation value)?  onCancelInvitation,TResult? Function( HomeEventOnAcceptInvitation value)?  onAcceptInvitation,TResult? Function( HomeEventOnRejectInvitation value)?  onRejectInvitation,TResult? Function( HomeEventOnNicknameSaved value)?  onNicknameSaved,TResult? Function( HomeEventOnInvitationReceived value)?  onInvitationReceived,TResult? Function( HomeEventOnInvitationRejected value)?  onInvitationRejected,TResult? Function( HomeEventOnConnected value)?  onConnected,}){
final _that = this;
switch (_that) {
case HomeEventOnInitializationRequested() when onInitializationRequested != null:
return onInitializationRequested(_that);case HomeEventOnInvite() when onInvite != null:
return onInvite(_that);case HomeEventOnCancelInvitation() when onCancelInvitation != null:
return onCancelInvitation(_that);case HomeEventOnAcceptInvitation() when onAcceptInvitation != null:
return onAcceptInvitation(_that);case HomeEventOnRejectInvitation() when onRejectInvitation != null:
return onRejectInvitation(_that);case HomeEventOnNicknameSaved() when onNicknameSaved != null:
return onNicknameSaved(_that);case HomeEventOnInvitationReceived() when onInvitationReceived != null:
return onInvitationReceived(_that);case HomeEventOnInvitationRejected() when onInvitationRejected != null:
return onInvitationRejected(_that);case HomeEventOnConnected() when onConnected != null:
return onConnected(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  onInitializationRequested,TResult Function()?  onInvite,TResult Function()?  onCancelInvitation,TResult Function()?  onAcceptInvitation,TResult Function()?  onRejectInvitation,TResult Function( String nickname)?  onNicknameSaved,TResult Function( User invitingUser)?  onInvitationReceived,TResult Function( User rejectedUser)?  onInvitationRejected,TResult Function( User opponent)?  onConnected,required TResult orElse(),}) {final _that = this;
switch (_that) {
case HomeEventOnInitializationRequested() when onInitializationRequested != null:
return onInitializationRequested();case HomeEventOnInvite() when onInvite != null:
return onInvite();case HomeEventOnCancelInvitation() when onCancelInvitation != null:
return onCancelInvitation();case HomeEventOnAcceptInvitation() when onAcceptInvitation != null:
return onAcceptInvitation();case HomeEventOnRejectInvitation() when onRejectInvitation != null:
return onRejectInvitation();case HomeEventOnNicknameSaved() when onNicknameSaved != null:
return onNicknameSaved(_that.nickname);case HomeEventOnInvitationReceived() when onInvitationReceived != null:
return onInvitationReceived(_that.invitingUser);case HomeEventOnInvitationRejected() when onInvitationRejected != null:
return onInvitationRejected(_that.rejectedUser);case HomeEventOnConnected() when onConnected != null:
return onConnected(_that.opponent);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  onInitializationRequested,required TResult Function()  onInvite,required TResult Function()  onCancelInvitation,required TResult Function()  onAcceptInvitation,required TResult Function()  onRejectInvitation,required TResult Function( String nickname)  onNicknameSaved,required TResult Function( User invitingUser)  onInvitationReceived,required TResult Function( User rejectedUser)  onInvitationRejected,required TResult Function( User opponent)  onConnected,}) {final _that = this;
switch (_that) {
case HomeEventOnInitializationRequested():
return onInitializationRequested();case HomeEventOnInvite():
return onInvite();case HomeEventOnCancelInvitation():
return onCancelInvitation();case HomeEventOnAcceptInvitation():
return onAcceptInvitation();case HomeEventOnRejectInvitation():
return onRejectInvitation();case HomeEventOnNicknameSaved():
return onNicknameSaved(_that.nickname);case HomeEventOnInvitationReceived():
return onInvitationReceived(_that.invitingUser);case HomeEventOnInvitationRejected():
return onInvitationRejected(_that.rejectedUser);case HomeEventOnConnected():
return onConnected(_that.opponent);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  onInitializationRequested,TResult? Function()?  onInvite,TResult? Function()?  onCancelInvitation,TResult? Function()?  onAcceptInvitation,TResult? Function()?  onRejectInvitation,TResult? Function( String nickname)?  onNicknameSaved,TResult? Function( User invitingUser)?  onInvitationReceived,TResult? Function( User rejectedUser)?  onInvitationRejected,TResult? Function( User opponent)?  onConnected,}) {final _that = this;
switch (_that) {
case HomeEventOnInitializationRequested() when onInitializationRequested != null:
return onInitializationRequested();case HomeEventOnInvite() when onInvite != null:
return onInvite();case HomeEventOnCancelInvitation() when onCancelInvitation != null:
return onCancelInvitation();case HomeEventOnAcceptInvitation() when onAcceptInvitation != null:
return onAcceptInvitation();case HomeEventOnRejectInvitation() when onRejectInvitation != null:
return onRejectInvitation();case HomeEventOnNicknameSaved() when onNicknameSaved != null:
return onNicknameSaved(_that.nickname);case HomeEventOnInvitationReceived() when onInvitationReceived != null:
return onInvitationReceived(_that.invitingUser);case HomeEventOnInvitationRejected() when onInvitationRejected != null:
return onInvitationRejected(_that.rejectedUser);case HomeEventOnConnected() when onConnected != null:
return onConnected(_that.opponent);case _:
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


class HomeEventOnInvite implements HomeEvent {
  const HomeEventOnInvite();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeEventOnInvite);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent.onInvite()';
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


class HomeEventOnInvitationReceived implements HomeEvent {
  const HomeEventOnInvitationReceived({required this.invitingUser});
  

 final  User invitingUser;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeEventOnInvitationReceivedCopyWith<HomeEventOnInvitationReceived> get copyWith => _$HomeEventOnInvitationReceivedCopyWithImpl<HomeEventOnInvitationReceived>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeEventOnInvitationReceived&&(identical(other.invitingUser, invitingUser) || other.invitingUser == invitingUser));
}


@override
int get hashCode => Object.hash(runtimeType,invitingUser);

@override
String toString() {
  return 'HomeEvent.onInvitationReceived(invitingUser: $invitingUser)';
}


}

/// @nodoc
abstract mixin class $HomeEventOnInvitationReceivedCopyWith<$Res> implements $HomeEventCopyWith<$Res> {
  factory $HomeEventOnInvitationReceivedCopyWith(HomeEventOnInvitationReceived value, $Res Function(HomeEventOnInvitationReceived) _then) = _$HomeEventOnInvitationReceivedCopyWithImpl;
@useResult
$Res call({
 User invitingUser
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
@pragma('vm:prefer-inline') $Res call({Object? invitingUser = null,}) {
  return _then(HomeEventOnInvitationReceived(
invitingUser: null == invitingUser ? _self.invitingUser : invitingUser // ignore: cast_nullable_to_non_nullable
as User,
  ));
}


}

/// @nodoc


class HomeEventOnInvitationRejected implements HomeEvent {
  const HomeEventOnInvitationRejected({required this.rejectedUser});
  

 final  User rejectedUser;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeEventOnInvitationRejectedCopyWith<HomeEventOnInvitationRejected> get copyWith => _$HomeEventOnInvitationRejectedCopyWithImpl<HomeEventOnInvitationRejected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeEventOnInvitationRejected&&(identical(other.rejectedUser, rejectedUser) || other.rejectedUser == rejectedUser));
}


@override
int get hashCode => Object.hash(runtimeType,rejectedUser);

@override
String toString() {
  return 'HomeEvent.onInvitationRejected(rejectedUser: $rejectedUser)';
}


}

/// @nodoc
abstract mixin class $HomeEventOnInvitationRejectedCopyWith<$Res> implements $HomeEventCopyWith<$Res> {
  factory $HomeEventOnInvitationRejectedCopyWith(HomeEventOnInvitationRejected value, $Res Function(HomeEventOnInvitationRejected) _then) = _$HomeEventOnInvitationRejectedCopyWithImpl;
@useResult
$Res call({
 User rejectedUser
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
@pragma('vm:prefer-inline') $Res call({Object? rejectedUser = null,}) {
  return _then(HomeEventOnInvitationRejected(
rejectedUser: null == rejectedUser ? _self.rejectedUser : rejectedUser // ignore: cast_nullable_to_non_nullable
as User,
  ));
}


}

/// @nodoc


class HomeEventOnConnected implements HomeEvent {
  const HomeEventOnConnected({required this.opponent});
  

 final  User opponent;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeEventOnConnectedCopyWith<HomeEventOnConnected> get copyWith => _$HomeEventOnConnectedCopyWithImpl<HomeEventOnConnected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeEventOnConnected&&(identical(other.opponent, opponent) || other.opponent == opponent));
}


@override
int get hashCode => Object.hash(runtimeType,opponent);

@override
String toString() {
  return 'HomeEvent.onConnected(opponent: $opponent)';
}


}

/// @nodoc
abstract mixin class $HomeEventOnConnectedCopyWith<$Res> implements $HomeEventCopyWith<$Res> {
  factory $HomeEventOnConnectedCopyWith(HomeEventOnConnected value, $Res Function(HomeEventOnConnected) _then) = _$HomeEventOnConnectedCopyWithImpl;
@useResult
$Res call({
 User opponent
});




}
/// @nodoc
class _$HomeEventOnConnectedCopyWithImpl<$Res>
    implements $HomeEventOnConnectedCopyWith<$Res> {
  _$HomeEventOnConnectedCopyWithImpl(this._self, this._then);

  final HomeEventOnConnected _self;
  final $Res Function(HomeEventOnConnected) _then;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? opponent = null,}) {
  return _then(HomeEventOnConnected(
opponent: null == opponent ? _self.opponent : opponent // ignore: cast_nullable_to_non_nullable
as User,
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( HomeStateInitializationPending value)?  initializationPending,TResult Function( HomeStateInitializationError value)?  initializationError,TResult Function( HomeStateView value)?  view,TResult Function( HomeStateInvitationPending value)?  invitationPending,TResult Function( HomeStateInvitationReceived value)?  invitationReceived,TResult Function( HomeStateInvitationRejected value)?  invitationRejected,TResult Function( HomeStateConnectionError value)?  connectionError,TResult Function( HomeStateConnected value)?  connected,required TResult orElse(),}){
final _that = this;
switch (_that) {
case HomeStateInitializationPending() when initializationPending != null:
return initializationPending(_that);case HomeStateInitializationError() when initializationError != null:
return initializationError(_that);case HomeStateView() when view != null:
return view(_that);case HomeStateInvitationPending() when invitationPending != null:
return invitationPending(_that);case HomeStateInvitationReceived() when invitationReceived != null:
return invitationReceived(_that);case HomeStateInvitationRejected() when invitationRejected != null:
return invitationRejected(_that);case HomeStateConnectionError() when connectionError != null:
return connectionError(_that);case HomeStateConnected() when connected != null:
return connected(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( HomeStateInitializationPending value)  initializationPending,required TResult Function( HomeStateInitializationError value)  initializationError,required TResult Function( HomeStateView value)  view,required TResult Function( HomeStateInvitationPending value)  invitationPending,required TResult Function( HomeStateInvitationReceived value)  invitationReceived,required TResult Function( HomeStateInvitationRejected value)  invitationRejected,required TResult Function( HomeStateConnectionError value)  connectionError,required TResult Function( HomeStateConnected value)  connected,}){
final _that = this;
switch (_that) {
case HomeStateInitializationPending():
return initializationPending(_that);case HomeStateInitializationError():
return initializationError(_that);case HomeStateView():
return view(_that);case HomeStateInvitationPending():
return invitationPending(_that);case HomeStateInvitationReceived():
return invitationReceived(_that);case HomeStateInvitationRejected():
return invitationRejected(_that);case HomeStateConnectionError():
return connectionError(_that);case HomeStateConnected():
return connected(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( HomeStateInitializationPending value)?  initializationPending,TResult? Function( HomeStateInitializationError value)?  initializationError,TResult? Function( HomeStateView value)?  view,TResult? Function( HomeStateInvitationPending value)?  invitationPending,TResult? Function( HomeStateInvitationReceived value)?  invitationReceived,TResult? Function( HomeStateInvitationRejected value)?  invitationRejected,TResult? Function( HomeStateConnectionError value)?  connectionError,TResult? Function( HomeStateConnected value)?  connected,}){
final _that = this;
switch (_that) {
case HomeStateInitializationPending() when initializationPending != null:
return initializationPending(_that);case HomeStateInitializationError() when initializationError != null:
return initializationError(_that);case HomeStateView() when view != null:
return view(_that);case HomeStateInvitationPending() when invitationPending != null:
return invitationPending(_that);case HomeStateInvitationReceived() when invitationReceived != null:
return invitationReceived(_that);case HomeStateInvitationRejected() when invitationRejected != null:
return invitationRejected(_that);case HomeStateConnectionError() when connectionError != null:
return connectionError(_that);case HomeStateConnected() when connected != null:
return connected(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initializationPending,TResult Function( String message)?  initializationError,TResult Function()?  view,TResult Function( Device invitedDevice)?  invitationPending,TResult Function( User invitingUser)?  invitationReceived,TResult Function( User rejectedUser)?  invitationRejected,TResult Function( String message)?  connectionError,TResult Function( User opponent,  PlayerType myPlayerType)?  connected,required TResult orElse(),}) {final _that = this;
switch (_that) {
case HomeStateInitializationPending() when initializationPending != null:
return initializationPending();case HomeStateInitializationError() when initializationError != null:
return initializationError(_that.message);case HomeStateView() when view != null:
return view();case HomeStateInvitationPending() when invitationPending != null:
return invitationPending(_that.invitedDevice);case HomeStateInvitationReceived() when invitationReceived != null:
return invitationReceived(_that.invitingUser);case HomeStateInvitationRejected() when invitationRejected != null:
return invitationRejected(_that.rejectedUser);case HomeStateConnectionError() when connectionError != null:
return connectionError(_that.message);case HomeStateConnected() when connected != null:
return connected(_that.opponent,_that.myPlayerType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initializationPending,required TResult Function( String message)  initializationError,required TResult Function()  view,required TResult Function( Device invitedDevice)  invitationPending,required TResult Function( User invitingUser)  invitationReceived,required TResult Function( User rejectedUser)  invitationRejected,required TResult Function( String message)  connectionError,required TResult Function( User opponent,  PlayerType myPlayerType)  connected,}) {final _that = this;
switch (_that) {
case HomeStateInitializationPending():
return initializationPending();case HomeStateInitializationError():
return initializationError(_that.message);case HomeStateView():
return view();case HomeStateInvitationPending():
return invitationPending(_that.invitedDevice);case HomeStateInvitationReceived():
return invitationReceived(_that.invitingUser);case HomeStateInvitationRejected():
return invitationRejected(_that.rejectedUser);case HomeStateConnectionError():
return connectionError(_that.message);case HomeStateConnected():
return connected(_that.opponent,_that.myPlayerType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initializationPending,TResult? Function( String message)?  initializationError,TResult? Function()?  view,TResult? Function( Device invitedDevice)?  invitationPending,TResult? Function( User invitingUser)?  invitationReceived,TResult? Function( User rejectedUser)?  invitationRejected,TResult? Function( String message)?  connectionError,TResult? Function( User opponent,  PlayerType myPlayerType)?  connected,}) {final _that = this;
switch (_that) {
case HomeStateInitializationPending() when initializationPending != null:
return initializationPending();case HomeStateInitializationError() when initializationError != null:
return initializationError(_that.message);case HomeStateView() when view != null:
return view();case HomeStateInvitationPending() when invitationPending != null:
return invitationPending(_that.invitedDevice);case HomeStateInvitationReceived() when invitationReceived != null:
return invitationReceived(_that.invitingUser);case HomeStateInvitationRejected() when invitationRejected != null:
return invitationRejected(_that.rejectedUser);case HomeStateConnectionError() when connectionError != null:
return connectionError(_that.message);case HomeStateConnected() when connected != null:
return connected(_that.opponent,_that.myPlayerType);case _:
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
  const HomeStateView();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeStateView);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeState.view()';
}


}




/// @nodoc


class HomeStateInvitationPending implements HomeState {
  const HomeStateInvitationPending({required this.invitedDevice});
  

 final  Device invitedDevice;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeStateInvitationPendingCopyWith<HomeStateInvitationPending> get copyWith => _$HomeStateInvitationPendingCopyWithImpl<HomeStateInvitationPending>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeStateInvitationPending&&(identical(other.invitedDevice, invitedDevice) || other.invitedDevice == invitedDevice));
}


@override
int get hashCode => Object.hash(runtimeType,invitedDevice);

@override
String toString() {
  return 'HomeState.invitationPending(invitedDevice: $invitedDevice)';
}


}

/// @nodoc
abstract mixin class $HomeStateInvitationPendingCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory $HomeStateInvitationPendingCopyWith(HomeStateInvitationPending value, $Res Function(HomeStateInvitationPending) _then) = _$HomeStateInvitationPendingCopyWithImpl;
@useResult
$Res call({
 Device invitedDevice
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
@pragma('vm:prefer-inline') $Res call({Object? invitedDevice = null,}) {
  return _then(HomeStateInvitationPending(
invitedDevice: null == invitedDevice ? _self.invitedDevice : invitedDevice // ignore: cast_nullable_to_non_nullable
as Device,
  ));
}


}

/// @nodoc


class HomeStateInvitationReceived implements HomeState {
  const HomeStateInvitationReceived({required this.invitingUser});
  

 final  User invitingUser;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeStateInvitationReceivedCopyWith<HomeStateInvitationReceived> get copyWith => _$HomeStateInvitationReceivedCopyWithImpl<HomeStateInvitationReceived>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeStateInvitationReceived&&(identical(other.invitingUser, invitingUser) || other.invitingUser == invitingUser));
}


@override
int get hashCode => Object.hash(runtimeType,invitingUser);

@override
String toString() {
  return 'HomeState.invitationReceived(invitingUser: $invitingUser)';
}


}

/// @nodoc
abstract mixin class $HomeStateInvitationReceivedCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory $HomeStateInvitationReceivedCopyWith(HomeStateInvitationReceived value, $Res Function(HomeStateInvitationReceived) _then) = _$HomeStateInvitationReceivedCopyWithImpl;
@useResult
$Res call({
 User invitingUser
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
@pragma('vm:prefer-inline') $Res call({Object? invitingUser = null,}) {
  return _then(HomeStateInvitationReceived(
invitingUser: null == invitingUser ? _self.invitingUser : invitingUser // ignore: cast_nullable_to_non_nullable
as User,
  ));
}


}

/// @nodoc


class HomeStateInvitationRejected implements HomeState {
  const HomeStateInvitationRejected({required this.rejectedUser});
  

 final  User rejectedUser;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeStateInvitationRejectedCopyWith<HomeStateInvitationRejected> get copyWith => _$HomeStateInvitationRejectedCopyWithImpl<HomeStateInvitationRejected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeStateInvitationRejected&&(identical(other.rejectedUser, rejectedUser) || other.rejectedUser == rejectedUser));
}


@override
int get hashCode => Object.hash(runtimeType,rejectedUser);

@override
String toString() {
  return 'HomeState.invitationRejected(rejectedUser: $rejectedUser)';
}


}

/// @nodoc
abstract mixin class $HomeStateInvitationRejectedCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory $HomeStateInvitationRejectedCopyWith(HomeStateInvitationRejected value, $Res Function(HomeStateInvitationRejected) _then) = _$HomeStateInvitationRejectedCopyWithImpl;
@useResult
$Res call({
 User rejectedUser
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
@pragma('vm:prefer-inline') $Res call({Object? rejectedUser = null,}) {
  return _then(HomeStateInvitationRejected(
rejectedUser: null == rejectedUser ? _self.rejectedUser : rejectedUser // ignore: cast_nullable_to_non_nullable
as User,
  ));
}


}

/// @nodoc


class HomeStateConnectionError implements HomeState {
  const HomeStateConnectionError({required this.message});
  

 final  String message;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeStateConnectionErrorCopyWith<HomeStateConnectionError> get copyWith => _$HomeStateConnectionErrorCopyWithImpl<HomeStateConnectionError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeStateConnectionError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'HomeState.connectionError(message: $message)';
}


}

/// @nodoc
abstract mixin class $HomeStateConnectionErrorCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory $HomeStateConnectionErrorCopyWith(HomeStateConnectionError value, $Res Function(HomeStateConnectionError) _then) = _$HomeStateConnectionErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$HomeStateConnectionErrorCopyWithImpl<$Res>
    implements $HomeStateConnectionErrorCopyWith<$Res> {
  _$HomeStateConnectionErrorCopyWithImpl(this._self, this._then);

  final HomeStateConnectionError _self;
  final $Res Function(HomeStateConnectionError) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(HomeStateConnectionError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class HomeStateConnected implements HomeState {
  const HomeStateConnected({required this.opponent, required this.myPlayerType});
  

 final  User opponent;
 final  PlayerType myPlayerType;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeStateConnectedCopyWith<HomeStateConnected> get copyWith => _$HomeStateConnectedCopyWithImpl<HomeStateConnected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeStateConnected&&(identical(other.opponent, opponent) || other.opponent == opponent)&&(identical(other.myPlayerType, myPlayerType) || other.myPlayerType == myPlayerType));
}


@override
int get hashCode => Object.hash(runtimeType,opponent,myPlayerType);

@override
String toString() {
  return 'HomeState.connected(opponent: $opponent, myPlayerType: $myPlayerType)';
}


}

/// @nodoc
abstract mixin class $HomeStateConnectedCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory $HomeStateConnectedCopyWith(HomeStateConnected value, $Res Function(HomeStateConnected) _then) = _$HomeStateConnectedCopyWithImpl;
@useResult
$Res call({
 User opponent, PlayerType myPlayerType
});




}
/// @nodoc
class _$HomeStateConnectedCopyWithImpl<$Res>
    implements $HomeStateConnectedCopyWith<$Res> {
  _$HomeStateConnectedCopyWithImpl(this._self, this._then);

  final HomeStateConnected _self;
  final $Res Function(HomeStateConnected) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? opponent = null,Object? myPlayerType = null,}) {
  return _then(HomeStateConnected(
opponent: null == opponent ? _self.opponent : opponent // ignore: cast_nullable_to_non_nullable
as User,myPlayerType: null == myPlayerType ? _self.myPlayerType : myPlayerType // ignore: cast_nullable_to_non_nullable
as PlayerType,
  ));
}


}

// dart format on
