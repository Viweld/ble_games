// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'server_session_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ServerSessionEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServerSessionEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ServerSessionEvent()';
}


}

/// @nodoc
class $ServerSessionEventCopyWith<$Res>  {
$ServerSessionEventCopyWith(ServerSessionEvent _, $Res Function(ServerSessionEvent) __);
}


/// Adds pattern-matching-related methods to [ServerSessionEvent].
extension ServerSessionEventPatterns on ServerSessionEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ServerSessionEventOnInitializationRequested value)?  onInitializationRequested,TResult Function( ServerSessionEventOnInvitationReceived value)?  onInvitationReceived,TResult Function( ServerSessionEventOnAcceptTapped value)?  onAcceptTapped,TResult Function( ServerSessionEventOnRejectTapped value)?  onRejectTapped,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ServerSessionEventOnInitializationRequested() when onInitializationRequested != null:
return onInitializationRequested(_that);case ServerSessionEventOnInvitationReceived() when onInvitationReceived != null:
return onInvitationReceived(_that);case ServerSessionEventOnAcceptTapped() when onAcceptTapped != null:
return onAcceptTapped(_that);case ServerSessionEventOnRejectTapped() when onRejectTapped != null:
return onRejectTapped(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ServerSessionEventOnInitializationRequested value)  onInitializationRequested,required TResult Function( ServerSessionEventOnInvitationReceived value)  onInvitationReceived,required TResult Function( ServerSessionEventOnAcceptTapped value)  onAcceptTapped,required TResult Function( ServerSessionEventOnRejectTapped value)  onRejectTapped,}){
final _that = this;
switch (_that) {
case ServerSessionEventOnInitializationRequested():
return onInitializationRequested(_that);case ServerSessionEventOnInvitationReceived():
return onInvitationReceived(_that);case ServerSessionEventOnAcceptTapped():
return onAcceptTapped(_that);case ServerSessionEventOnRejectTapped():
return onRejectTapped(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ServerSessionEventOnInitializationRequested value)?  onInitializationRequested,TResult? Function( ServerSessionEventOnInvitationReceived value)?  onInvitationReceived,TResult? Function( ServerSessionEventOnAcceptTapped value)?  onAcceptTapped,TResult? Function( ServerSessionEventOnRejectTapped value)?  onRejectTapped,}){
final _that = this;
switch (_that) {
case ServerSessionEventOnInitializationRequested() when onInitializationRequested != null:
return onInitializationRequested(_that);case ServerSessionEventOnInvitationReceived() when onInvitationReceived != null:
return onInvitationReceived(_that);case ServerSessionEventOnAcceptTapped() when onAcceptTapped != null:
return onAcceptTapped(_that);case ServerSessionEventOnRejectTapped() when onRejectTapped != null:
return onRejectTapped(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  onInitializationRequested,TResult Function( User remoteUser,  Device remoteDevice)?  onInvitationReceived,TResult Function()?  onAcceptTapped,TResult Function()?  onRejectTapped,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ServerSessionEventOnInitializationRequested() when onInitializationRequested != null:
return onInitializationRequested();case ServerSessionEventOnInvitationReceived() when onInvitationReceived != null:
return onInvitationReceived(_that.remoteUser,_that.remoteDevice);case ServerSessionEventOnAcceptTapped() when onAcceptTapped != null:
return onAcceptTapped();case ServerSessionEventOnRejectTapped() when onRejectTapped != null:
return onRejectTapped();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  onInitializationRequested,required TResult Function( User remoteUser,  Device remoteDevice)  onInvitationReceived,required TResult Function()  onAcceptTapped,required TResult Function()  onRejectTapped,}) {final _that = this;
switch (_that) {
case ServerSessionEventOnInitializationRequested():
return onInitializationRequested();case ServerSessionEventOnInvitationReceived():
return onInvitationReceived(_that.remoteUser,_that.remoteDevice);case ServerSessionEventOnAcceptTapped():
return onAcceptTapped();case ServerSessionEventOnRejectTapped():
return onRejectTapped();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  onInitializationRequested,TResult? Function( User remoteUser,  Device remoteDevice)?  onInvitationReceived,TResult? Function()?  onAcceptTapped,TResult? Function()?  onRejectTapped,}) {final _that = this;
switch (_that) {
case ServerSessionEventOnInitializationRequested() when onInitializationRequested != null:
return onInitializationRequested();case ServerSessionEventOnInvitationReceived() when onInvitationReceived != null:
return onInvitationReceived(_that.remoteUser,_that.remoteDevice);case ServerSessionEventOnAcceptTapped() when onAcceptTapped != null:
return onAcceptTapped();case ServerSessionEventOnRejectTapped() when onRejectTapped != null:
return onRejectTapped();case _:
  return null;

}
}

}

/// @nodoc


class ServerSessionEventOnInitializationRequested implements ServerSessionEvent {
  const ServerSessionEventOnInitializationRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServerSessionEventOnInitializationRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ServerSessionEvent.onInitializationRequested()';
}


}




/// @nodoc


class ServerSessionEventOnInvitationReceived implements ServerSessionEvent {
  const ServerSessionEventOnInvitationReceived({required this.remoteUser, required this.remoteDevice});
  

 final  User remoteUser;
 final  Device remoteDevice;

/// Create a copy of ServerSessionEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServerSessionEventOnInvitationReceivedCopyWith<ServerSessionEventOnInvitationReceived> get copyWith => _$ServerSessionEventOnInvitationReceivedCopyWithImpl<ServerSessionEventOnInvitationReceived>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServerSessionEventOnInvitationReceived&&(identical(other.remoteUser, remoteUser) || other.remoteUser == remoteUser)&&(identical(other.remoteDevice, remoteDevice) || other.remoteDevice == remoteDevice));
}


@override
int get hashCode => Object.hash(runtimeType,remoteUser,remoteDevice);

@override
String toString() {
  return 'ServerSessionEvent.onInvitationReceived(remoteUser: $remoteUser, remoteDevice: $remoteDevice)';
}


}

/// @nodoc
abstract mixin class $ServerSessionEventOnInvitationReceivedCopyWith<$Res> implements $ServerSessionEventCopyWith<$Res> {
  factory $ServerSessionEventOnInvitationReceivedCopyWith(ServerSessionEventOnInvitationReceived value, $Res Function(ServerSessionEventOnInvitationReceived) _then) = _$ServerSessionEventOnInvitationReceivedCopyWithImpl;
@useResult
$Res call({
 User remoteUser, Device remoteDevice
});




}
/// @nodoc
class _$ServerSessionEventOnInvitationReceivedCopyWithImpl<$Res>
    implements $ServerSessionEventOnInvitationReceivedCopyWith<$Res> {
  _$ServerSessionEventOnInvitationReceivedCopyWithImpl(this._self, this._then);

  final ServerSessionEventOnInvitationReceived _self;
  final $Res Function(ServerSessionEventOnInvitationReceived) _then;

/// Create a copy of ServerSessionEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? remoteUser = null,Object? remoteDevice = null,}) {
  return _then(ServerSessionEventOnInvitationReceived(
remoteUser: null == remoteUser ? _self.remoteUser : remoteUser // ignore: cast_nullable_to_non_nullable
as User,remoteDevice: null == remoteDevice ? _self.remoteDevice : remoteDevice // ignore: cast_nullable_to_non_nullable
as Device,
  ));
}


}

/// @nodoc


class ServerSessionEventOnAcceptTapped implements ServerSessionEvent {
  const ServerSessionEventOnAcceptTapped();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServerSessionEventOnAcceptTapped);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ServerSessionEvent.onAcceptTapped()';
}


}




/// @nodoc


class ServerSessionEventOnRejectTapped implements ServerSessionEvent {
  const ServerSessionEventOnRejectTapped();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServerSessionEventOnRejectTapped);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ServerSessionEvent.onRejectTapped()';
}


}




/// @nodoc
mixin _$ServerSessionState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServerSessionState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ServerSessionState()';
}


}

/// @nodoc
class $ServerSessionStateCopyWith<$Res>  {
$ServerSessionStateCopyWith(ServerSessionState _, $Res Function(ServerSessionState) __);
}


/// Adds pattern-matching-related methods to [ServerSessionState].
extension ServerSessionStatePatterns on ServerSessionState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ServerSessionStateInvitationPending value)?  invitationPending,TResult Function( ServerSessionStateUserDecision value)?  userDecision,TResult Function( ServerSessionStateCloseDialog value)?  connected,TResult Function( ServerSessionStateError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ServerSessionStateInvitationPending() when invitationPending != null:
return invitationPending(_that);case ServerSessionStateUserDecision() when userDecision != null:
return userDecision(_that);case ServerSessionStateCloseDialog() when connected != null:
return connected(_that);case ServerSessionStateError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ServerSessionStateInvitationPending value)  invitationPending,required TResult Function( ServerSessionStateUserDecision value)  userDecision,required TResult Function( ServerSessionStateCloseDialog value)  connected,required TResult Function( ServerSessionStateError value)  error,}){
final _that = this;
switch (_that) {
case ServerSessionStateInvitationPending():
return invitationPending(_that);case ServerSessionStateUserDecision():
return userDecision(_that);case ServerSessionStateCloseDialog():
return connected(_that);case ServerSessionStateError():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ServerSessionStateInvitationPending value)?  invitationPending,TResult? Function( ServerSessionStateUserDecision value)?  userDecision,TResult? Function( ServerSessionStateCloseDialog value)?  connected,TResult? Function( ServerSessionStateError value)?  error,}){
final _that = this;
switch (_that) {
case ServerSessionStateInvitationPending() when invitationPending != null:
return invitationPending(_that);case ServerSessionStateUserDecision() when userDecision != null:
return userDecision(_that);case ServerSessionStateCloseDialog() when connected != null:
return connected(_that);case ServerSessionStateError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  invitationPending,TResult Function( User remoteUser,  Device remoteDevice)?  userDecision,TResult Function()?  connected,TResult Function( String? message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ServerSessionStateInvitationPending() when invitationPending != null:
return invitationPending();case ServerSessionStateUserDecision() when userDecision != null:
return userDecision(_that.remoteUser,_that.remoteDevice);case ServerSessionStateCloseDialog() when connected != null:
return connected();case ServerSessionStateError() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  invitationPending,required TResult Function( User remoteUser,  Device remoteDevice)  userDecision,required TResult Function()  connected,required TResult Function( String? message)  error,}) {final _that = this;
switch (_that) {
case ServerSessionStateInvitationPending():
return invitationPending();case ServerSessionStateUserDecision():
return userDecision(_that.remoteUser,_that.remoteDevice);case ServerSessionStateCloseDialog():
return connected();case ServerSessionStateError():
return error(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  invitationPending,TResult? Function( User remoteUser,  Device remoteDevice)?  userDecision,TResult? Function()?  connected,TResult? Function( String? message)?  error,}) {final _that = this;
switch (_that) {
case ServerSessionStateInvitationPending() when invitationPending != null:
return invitationPending();case ServerSessionStateUserDecision() when userDecision != null:
return userDecision(_that.remoteUser,_that.remoteDevice);case ServerSessionStateCloseDialog() when connected != null:
return connected();case ServerSessionStateError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class ServerSessionStateInvitationPending implements ServerSessionState {
  const ServerSessionStateInvitationPending();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServerSessionStateInvitationPending);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ServerSessionState.invitationPending()';
}


}




/// @nodoc


class ServerSessionStateUserDecision implements ServerSessionState {
  const ServerSessionStateUserDecision({required this.remoteUser, required this.remoteDevice});
  

 final  User remoteUser;
 final  Device remoteDevice;

/// Create a copy of ServerSessionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServerSessionStateUserDecisionCopyWith<ServerSessionStateUserDecision> get copyWith => _$ServerSessionStateUserDecisionCopyWithImpl<ServerSessionStateUserDecision>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServerSessionStateUserDecision&&(identical(other.remoteUser, remoteUser) || other.remoteUser == remoteUser)&&(identical(other.remoteDevice, remoteDevice) || other.remoteDevice == remoteDevice));
}


@override
int get hashCode => Object.hash(runtimeType,remoteUser,remoteDevice);

@override
String toString() {
  return 'ServerSessionState.userDecision(remoteUser: $remoteUser, remoteDevice: $remoteDevice)';
}


}

/// @nodoc
abstract mixin class $ServerSessionStateUserDecisionCopyWith<$Res> implements $ServerSessionStateCopyWith<$Res> {
  factory $ServerSessionStateUserDecisionCopyWith(ServerSessionStateUserDecision value, $Res Function(ServerSessionStateUserDecision) _then) = _$ServerSessionStateUserDecisionCopyWithImpl;
@useResult
$Res call({
 User remoteUser, Device remoteDevice
});




}
/// @nodoc
class _$ServerSessionStateUserDecisionCopyWithImpl<$Res>
    implements $ServerSessionStateUserDecisionCopyWith<$Res> {
  _$ServerSessionStateUserDecisionCopyWithImpl(this._self, this._then);

  final ServerSessionStateUserDecision _self;
  final $Res Function(ServerSessionStateUserDecision) _then;

/// Create a copy of ServerSessionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? remoteUser = null,Object? remoteDevice = null,}) {
  return _then(ServerSessionStateUserDecision(
remoteUser: null == remoteUser ? _self.remoteUser : remoteUser // ignore: cast_nullable_to_non_nullable
as User,remoteDevice: null == remoteDevice ? _self.remoteDevice : remoteDevice // ignore: cast_nullable_to_non_nullable
as Device,
  ));
}


}

/// @nodoc


class ServerSessionStateCloseDialog implements ServerSessionState {
  const ServerSessionStateCloseDialog();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServerSessionStateCloseDialog);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ServerSessionState.connected()';
}


}




/// @nodoc


class ServerSessionStateError implements ServerSessionState {
  const ServerSessionStateError({this.message});
  

 final  String? message;

/// Create a copy of ServerSessionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServerSessionStateErrorCopyWith<ServerSessionStateError> get copyWith => _$ServerSessionStateErrorCopyWithImpl<ServerSessionStateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServerSessionStateError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ServerSessionState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ServerSessionStateErrorCopyWith<$Res> implements $ServerSessionStateCopyWith<$Res> {
  factory $ServerSessionStateErrorCopyWith(ServerSessionStateError value, $Res Function(ServerSessionStateError) _then) = _$ServerSessionStateErrorCopyWithImpl;
@useResult
$Res call({
 String? message
});




}
/// @nodoc
class _$ServerSessionStateErrorCopyWithImpl<$Res>
    implements $ServerSessionStateErrorCopyWith<$Res> {
  _$ServerSessionStateErrorCopyWithImpl(this._self, this._then);

  final ServerSessionStateError _self;
  final $Res Function(ServerSessionStateError) _then;

/// Create a copy of ServerSessionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = freezed,}) {
  return _then(ServerSessionStateError(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
