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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( HomeEventOnInitializationRequested value)?  onInitializationRequested,TResult Function( HomeEventOnStartAwaitingConnection value)?  onStartAwaitingConnection,TResult Function( HomeEventOnStartSearchingDevices value)?  onStartSearchingDevices,TResult Function( HomeEventOnCancelAwaiting value)?  onCancelAwaiting,TResult Function( HomeEventOnCancelSearching value)?  onCancelSearching,TResult Function( HomeEventOnConnectToDevice value)?  onConnectToDevice,TResult Function( HomeEventOnRefreshRequested value)?  onRefreshRequested,TResult Function( HomeEventOnDeviceSelected value)?  onDeviceSelected,TResult Function( HomeEventOnInvite value)?  onInvite,TResult Function( HomeEventOnCancelInvitation value)?  onCancelInvitation,TResult Function( HomeEventOnAcceptInvitation value)?  onAcceptInvitation,TResult Function( HomeEventOnRejectInvitation value)?  onRejectInvitation,TResult Function( HomeEventOnNicknameSaved value)?  onNicknameSaved,TResult Function( HomeEventOnViewStateChanged value)?  onViewStateChanged,TResult Function( HomeEventOnInvitationReceived value)?  onInvitationReceived,TResult Function( HomeEventOnInvitationRejected value)?  onInvitationRejected,TResult Function( HomeEventOnGameStarted value)?  onGameStarted,TResult Function( HomeEventOnSendMessage value)?  onSendMessage,TResult Function( HomeEventOnNavigateToMessageTest value)?  onNavigateToMessageTest,TResult Function( HomeEventOnNavigateToConnectionTest value)?  onNavigateToConnectionTest,TResult Function( HomeEventOnMessageReceived value)?  onMessageReceived,required TResult orElse(),}){
final _that = this;
switch (_that) {
case HomeEventOnInitializationRequested() when onInitializationRequested != null:
return onInitializationRequested(_that);case HomeEventOnStartAwaitingConnection() when onStartAwaitingConnection != null:
return onStartAwaitingConnection(_that);case HomeEventOnStartSearchingDevices() when onStartSearchingDevices != null:
return onStartSearchingDevices(_that);case HomeEventOnCancelAwaiting() when onCancelAwaiting != null:
return onCancelAwaiting(_that);case HomeEventOnCancelSearching() when onCancelSearching != null:
return onCancelSearching(_that);case HomeEventOnConnectToDevice() when onConnectToDevice != null:
return onConnectToDevice(_that);case HomeEventOnRefreshRequested() when onRefreshRequested != null:
return onRefreshRequested(_that);case HomeEventOnDeviceSelected() when onDeviceSelected != null:
return onDeviceSelected(_that);case HomeEventOnInvite() when onInvite != null:
return onInvite(_that);case HomeEventOnCancelInvitation() when onCancelInvitation != null:
return onCancelInvitation(_that);case HomeEventOnAcceptInvitation() when onAcceptInvitation != null:
return onAcceptInvitation(_that);case HomeEventOnRejectInvitation() when onRejectInvitation != null:
return onRejectInvitation(_that);case HomeEventOnNicknameSaved() when onNicknameSaved != null:
return onNicknameSaved(_that);case HomeEventOnViewStateChanged() when onViewStateChanged != null:
return onViewStateChanged(_that);case HomeEventOnInvitationReceived() when onInvitationReceived != null:
return onInvitationReceived(_that);case HomeEventOnInvitationRejected() when onInvitationRejected != null:
return onInvitationRejected(_that);case HomeEventOnGameStarted() when onGameStarted != null:
return onGameStarted(_that);case HomeEventOnSendMessage() when onSendMessage != null:
return onSendMessage(_that);case HomeEventOnNavigateToMessageTest() when onNavigateToMessageTest != null:
return onNavigateToMessageTest(_that);case HomeEventOnNavigateToConnectionTest() when onNavigateToConnectionTest != null:
return onNavigateToConnectionTest(_that);case HomeEventOnMessageReceived() when onMessageReceived != null:
return onMessageReceived(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( HomeEventOnInitializationRequested value)  onInitializationRequested,required TResult Function( HomeEventOnStartAwaitingConnection value)  onStartAwaitingConnection,required TResult Function( HomeEventOnStartSearchingDevices value)  onStartSearchingDevices,required TResult Function( HomeEventOnCancelAwaiting value)  onCancelAwaiting,required TResult Function( HomeEventOnCancelSearching value)  onCancelSearching,required TResult Function( HomeEventOnConnectToDevice value)  onConnectToDevice,required TResult Function( HomeEventOnRefreshRequested value)  onRefreshRequested,required TResult Function( HomeEventOnDeviceSelected value)  onDeviceSelected,required TResult Function( HomeEventOnInvite value)  onInvite,required TResult Function( HomeEventOnCancelInvitation value)  onCancelInvitation,required TResult Function( HomeEventOnAcceptInvitation value)  onAcceptInvitation,required TResult Function( HomeEventOnRejectInvitation value)  onRejectInvitation,required TResult Function( HomeEventOnNicknameSaved value)  onNicknameSaved,required TResult Function( HomeEventOnViewStateChanged value)  onViewStateChanged,required TResult Function( HomeEventOnInvitationReceived value)  onInvitationReceived,required TResult Function( HomeEventOnInvitationRejected value)  onInvitationRejected,required TResult Function( HomeEventOnGameStarted value)  onGameStarted,required TResult Function( HomeEventOnSendMessage value)  onSendMessage,required TResult Function( HomeEventOnNavigateToMessageTest value)  onNavigateToMessageTest,required TResult Function( HomeEventOnNavigateToConnectionTest value)  onNavigateToConnectionTest,required TResult Function( HomeEventOnMessageReceived value)  onMessageReceived,}){
final _that = this;
switch (_that) {
case HomeEventOnInitializationRequested():
return onInitializationRequested(_that);case HomeEventOnStartAwaitingConnection():
return onStartAwaitingConnection(_that);case HomeEventOnStartSearchingDevices():
return onStartSearchingDevices(_that);case HomeEventOnCancelAwaiting():
return onCancelAwaiting(_that);case HomeEventOnCancelSearching():
return onCancelSearching(_that);case HomeEventOnConnectToDevice():
return onConnectToDevice(_that);case HomeEventOnRefreshRequested():
return onRefreshRequested(_that);case HomeEventOnDeviceSelected():
return onDeviceSelected(_that);case HomeEventOnInvite():
return onInvite(_that);case HomeEventOnCancelInvitation():
return onCancelInvitation(_that);case HomeEventOnAcceptInvitation():
return onAcceptInvitation(_that);case HomeEventOnRejectInvitation():
return onRejectInvitation(_that);case HomeEventOnNicknameSaved():
return onNicknameSaved(_that);case HomeEventOnViewStateChanged():
return onViewStateChanged(_that);case HomeEventOnInvitationReceived():
return onInvitationReceived(_that);case HomeEventOnInvitationRejected():
return onInvitationRejected(_that);case HomeEventOnGameStarted():
return onGameStarted(_that);case HomeEventOnSendMessage():
return onSendMessage(_that);case HomeEventOnNavigateToMessageTest():
return onNavigateToMessageTest(_that);case HomeEventOnNavigateToConnectionTest():
return onNavigateToConnectionTest(_that);case HomeEventOnMessageReceived():
return onMessageReceived(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( HomeEventOnInitializationRequested value)?  onInitializationRequested,TResult? Function( HomeEventOnStartAwaitingConnection value)?  onStartAwaitingConnection,TResult? Function( HomeEventOnStartSearchingDevices value)?  onStartSearchingDevices,TResult? Function( HomeEventOnCancelAwaiting value)?  onCancelAwaiting,TResult? Function( HomeEventOnCancelSearching value)?  onCancelSearching,TResult? Function( HomeEventOnConnectToDevice value)?  onConnectToDevice,TResult? Function( HomeEventOnRefreshRequested value)?  onRefreshRequested,TResult? Function( HomeEventOnDeviceSelected value)?  onDeviceSelected,TResult? Function( HomeEventOnInvite value)?  onInvite,TResult? Function( HomeEventOnCancelInvitation value)?  onCancelInvitation,TResult? Function( HomeEventOnAcceptInvitation value)?  onAcceptInvitation,TResult? Function( HomeEventOnRejectInvitation value)?  onRejectInvitation,TResult? Function( HomeEventOnNicknameSaved value)?  onNicknameSaved,TResult? Function( HomeEventOnViewStateChanged value)?  onViewStateChanged,TResult? Function( HomeEventOnInvitationReceived value)?  onInvitationReceived,TResult? Function( HomeEventOnInvitationRejected value)?  onInvitationRejected,TResult? Function( HomeEventOnGameStarted value)?  onGameStarted,TResult? Function( HomeEventOnSendMessage value)?  onSendMessage,TResult? Function( HomeEventOnNavigateToMessageTest value)?  onNavigateToMessageTest,TResult? Function( HomeEventOnNavigateToConnectionTest value)?  onNavigateToConnectionTest,TResult? Function( HomeEventOnMessageReceived value)?  onMessageReceived,}){
final _that = this;
switch (_that) {
case HomeEventOnInitializationRequested() when onInitializationRequested != null:
return onInitializationRequested(_that);case HomeEventOnStartAwaitingConnection() when onStartAwaitingConnection != null:
return onStartAwaitingConnection(_that);case HomeEventOnStartSearchingDevices() when onStartSearchingDevices != null:
return onStartSearchingDevices(_that);case HomeEventOnCancelAwaiting() when onCancelAwaiting != null:
return onCancelAwaiting(_that);case HomeEventOnCancelSearching() when onCancelSearching != null:
return onCancelSearching(_that);case HomeEventOnConnectToDevice() when onConnectToDevice != null:
return onConnectToDevice(_that);case HomeEventOnRefreshRequested() when onRefreshRequested != null:
return onRefreshRequested(_that);case HomeEventOnDeviceSelected() when onDeviceSelected != null:
return onDeviceSelected(_that);case HomeEventOnInvite() when onInvite != null:
return onInvite(_that);case HomeEventOnCancelInvitation() when onCancelInvitation != null:
return onCancelInvitation(_that);case HomeEventOnAcceptInvitation() when onAcceptInvitation != null:
return onAcceptInvitation(_that);case HomeEventOnRejectInvitation() when onRejectInvitation != null:
return onRejectInvitation(_that);case HomeEventOnNicknameSaved() when onNicknameSaved != null:
return onNicknameSaved(_that);case HomeEventOnViewStateChanged() when onViewStateChanged != null:
return onViewStateChanged(_that);case HomeEventOnInvitationReceived() when onInvitationReceived != null:
return onInvitationReceived(_that);case HomeEventOnInvitationRejected() when onInvitationRejected != null:
return onInvitationRejected(_that);case HomeEventOnGameStarted() when onGameStarted != null:
return onGameStarted(_that);case HomeEventOnSendMessage() when onSendMessage != null:
return onSendMessage(_that);case HomeEventOnNavigateToMessageTest() when onNavigateToMessageTest != null:
return onNavigateToMessageTest(_that);case HomeEventOnNavigateToConnectionTest() when onNavigateToConnectionTest != null:
return onNavigateToConnectionTest(_that);case HomeEventOnMessageReceived() when onMessageReceived != null:
return onMessageReceived(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  onInitializationRequested,TResult Function()?  onStartAwaitingConnection,TResult Function()?  onStartSearchingDevices,TResult Function()?  onCancelAwaiting,TResult Function()?  onCancelSearching,TResult Function()?  onConnectToDevice,TResult Function()?  onRefreshRequested,TResult Function( Device device)?  onDeviceSelected,TResult Function()?  onInvite,TResult Function()?  onCancelInvitation,TResult Function()?  onAcceptInvitation,TResult Function()?  onRejectInvitation,TResult Function( String nickname)?  onNicknameSaved,TResult Function()?  onViewStateChanged,TResult Function( User invitingUser)?  onInvitationReceived,TResult Function( User rejectedUser)?  onInvitationRejected,TResult Function( User opponent)?  onGameStarted,TResult Function( String content)?  onSendMessage,TResult Function()?  onNavigateToMessageTest,TResult Function()?  onNavigateToConnectionTest,TResult Function( Message message)?  onMessageReceived,required TResult orElse(),}) {final _that = this;
switch (_that) {
case HomeEventOnInitializationRequested() when onInitializationRequested != null:
return onInitializationRequested();case HomeEventOnStartAwaitingConnection() when onStartAwaitingConnection != null:
return onStartAwaitingConnection();case HomeEventOnStartSearchingDevices() when onStartSearchingDevices != null:
return onStartSearchingDevices();case HomeEventOnCancelAwaiting() when onCancelAwaiting != null:
return onCancelAwaiting();case HomeEventOnCancelSearching() when onCancelSearching != null:
return onCancelSearching();case HomeEventOnConnectToDevice() when onConnectToDevice != null:
return onConnectToDevice();case HomeEventOnRefreshRequested() when onRefreshRequested != null:
return onRefreshRequested();case HomeEventOnDeviceSelected() when onDeviceSelected != null:
return onDeviceSelected(_that.device);case HomeEventOnInvite() when onInvite != null:
return onInvite();case HomeEventOnCancelInvitation() when onCancelInvitation != null:
return onCancelInvitation();case HomeEventOnAcceptInvitation() when onAcceptInvitation != null:
return onAcceptInvitation();case HomeEventOnRejectInvitation() when onRejectInvitation != null:
return onRejectInvitation();case HomeEventOnNicknameSaved() when onNicknameSaved != null:
return onNicknameSaved(_that.nickname);case HomeEventOnViewStateChanged() when onViewStateChanged != null:
return onViewStateChanged();case HomeEventOnInvitationReceived() when onInvitationReceived != null:
return onInvitationReceived(_that.invitingUser);case HomeEventOnInvitationRejected() when onInvitationRejected != null:
return onInvitationRejected(_that.rejectedUser);case HomeEventOnGameStarted() when onGameStarted != null:
return onGameStarted(_that.opponent);case HomeEventOnSendMessage() when onSendMessage != null:
return onSendMessage(_that.content);case HomeEventOnNavigateToMessageTest() when onNavigateToMessageTest != null:
return onNavigateToMessageTest();case HomeEventOnNavigateToConnectionTest() when onNavigateToConnectionTest != null:
return onNavigateToConnectionTest();case HomeEventOnMessageReceived() when onMessageReceived != null:
return onMessageReceived(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  onInitializationRequested,required TResult Function()  onStartAwaitingConnection,required TResult Function()  onStartSearchingDevices,required TResult Function()  onCancelAwaiting,required TResult Function()  onCancelSearching,required TResult Function()  onConnectToDevice,required TResult Function()  onRefreshRequested,required TResult Function( Device device)  onDeviceSelected,required TResult Function()  onInvite,required TResult Function()  onCancelInvitation,required TResult Function()  onAcceptInvitation,required TResult Function()  onRejectInvitation,required TResult Function( String nickname)  onNicknameSaved,required TResult Function()  onViewStateChanged,required TResult Function( User invitingUser)  onInvitationReceived,required TResult Function( User rejectedUser)  onInvitationRejected,required TResult Function( User opponent)  onGameStarted,required TResult Function( String content)  onSendMessage,required TResult Function()  onNavigateToMessageTest,required TResult Function()  onNavigateToConnectionTest,required TResult Function( Message message)  onMessageReceived,}) {final _that = this;
switch (_that) {
case HomeEventOnInitializationRequested():
return onInitializationRequested();case HomeEventOnStartAwaitingConnection():
return onStartAwaitingConnection();case HomeEventOnStartSearchingDevices():
return onStartSearchingDevices();case HomeEventOnCancelAwaiting():
return onCancelAwaiting();case HomeEventOnCancelSearching():
return onCancelSearching();case HomeEventOnConnectToDevice():
return onConnectToDevice();case HomeEventOnRefreshRequested():
return onRefreshRequested();case HomeEventOnDeviceSelected():
return onDeviceSelected(_that.device);case HomeEventOnInvite():
return onInvite();case HomeEventOnCancelInvitation():
return onCancelInvitation();case HomeEventOnAcceptInvitation():
return onAcceptInvitation();case HomeEventOnRejectInvitation():
return onRejectInvitation();case HomeEventOnNicknameSaved():
return onNicknameSaved(_that.nickname);case HomeEventOnViewStateChanged():
return onViewStateChanged();case HomeEventOnInvitationReceived():
return onInvitationReceived(_that.invitingUser);case HomeEventOnInvitationRejected():
return onInvitationRejected(_that.rejectedUser);case HomeEventOnGameStarted():
return onGameStarted(_that.opponent);case HomeEventOnSendMessage():
return onSendMessage(_that.content);case HomeEventOnNavigateToMessageTest():
return onNavigateToMessageTest();case HomeEventOnNavigateToConnectionTest():
return onNavigateToConnectionTest();case HomeEventOnMessageReceived():
return onMessageReceived(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  onInitializationRequested,TResult? Function()?  onStartAwaitingConnection,TResult? Function()?  onStartSearchingDevices,TResult? Function()?  onCancelAwaiting,TResult? Function()?  onCancelSearching,TResult? Function()?  onConnectToDevice,TResult? Function()?  onRefreshRequested,TResult? Function( Device device)?  onDeviceSelected,TResult? Function()?  onInvite,TResult? Function()?  onCancelInvitation,TResult? Function()?  onAcceptInvitation,TResult? Function()?  onRejectInvitation,TResult? Function( String nickname)?  onNicknameSaved,TResult? Function()?  onViewStateChanged,TResult? Function( User invitingUser)?  onInvitationReceived,TResult? Function( User rejectedUser)?  onInvitationRejected,TResult? Function( User opponent)?  onGameStarted,TResult? Function( String content)?  onSendMessage,TResult? Function()?  onNavigateToMessageTest,TResult? Function()?  onNavigateToConnectionTest,TResult? Function( Message message)?  onMessageReceived,}) {final _that = this;
switch (_that) {
case HomeEventOnInitializationRequested() when onInitializationRequested != null:
return onInitializationRequested();case HomeEventOnStartAwaitingConnection() when onStartAwaitingConnection != null:
return onStartAwaitingConnection();case HomeEventOnStartSearchingDevices() when onStartSearchingDevices != null:
return onStartSearchingDevices();case HomeEventOnCancelAwaiting() when onCancelAwaiting != null:
return onCancelAwaiting();case HomeEventOnCancelSearching() when onCancelSearching != null:
return onCancelSearching();case HomeEventOnConnectToDevice() when onConnectToDevice != null:
return onConnectToDevice();case HomeEventOnRefreshRequested() when onRefreshRequested != null:
return onRefreshRequested();case HomeEventOnDeviceSelected() when onDeviceSelected != null:
return onDeviceSelected(_that.device);case HomeEventOnInvite() when onInvite != null:
return onInvite();case HomeEventOnCancelInvitation() when onCancelInvitation != null:
return onCancelInvitation();case HomeEventOnAcceptInvitation() when onAcceptInvitation != null:
return onAcceptInvitation();case HomeEventOnRejectInvitation() when onRejectInvitation != null:
return onRejectInvitation();case HomeEventOnNicknameSaved() when onNicknameSaved != null:
return onNicknameSaved(_that.nickname);case HomeEventOnViewStateChanged() when onViewStateChanged != null:
return onViewStateChanged();case HomeEventOnInvitationReceived() when onInvitationReceived != null:
return onInvitationReceived(_that.invitingUser);case HomeEventOnInvitationRejected() when onInvitationRejected != null:
return onInvitationRejected(_that.rejectedUser);case HomeEventOnGameStarted() when onGameStarted != null:
return onGameStarted(_that.opponent);case HomeEventOnSendMessage() when onSendMessage != null:
return onSendMessage(_that.content);case HomeEventOnNavigateToMessageTest() when onNavigateToMessageTest != null:
return onNavigateToMessageTest();case HomeEventOnNavigateToConnectionTest() when onNavigateToConnectionTest != null:
return onNavigateToConnectionTest();case HomeEventOnMessageReceived() when onMessageReceived != null:
return onMessageReceived(_that.message);case _:
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


class HomeEventOnStartAwaitingConnection implements HomeEvent {
  const HomeEventOnStartAwaitingConnection();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeEventOnStartAwaitingConnection);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent.onStartAwaitingConnection()';
}


}




/// @nodoc


class HomeEventOnStartSearchingDevices implements HomeEvent {
  const HomeEventOnStartSearchingDevices();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeEventOnStartSearchingDevices);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent.onStartSearchingDevices()';
}


}




/// @nodoc


class HomeEventOnCancelAwaiting implements HomeEvent {
  const HomeEventOnCancelAwaiting();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeEventOnCancelAwaiting);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent.onCancelAwaiting()';
}


}




/// @nodoc


class HomeEventOnCancelSearching implements HomeEvent {
  const HomeEventOnCancelSearching();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeEventOnCancelSearching);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent.onCancelSearching()';
}


}




/// @nodoc


class HomeEventOnConnectToDevice implements HomeEvent {
  const HomeEventOnConnectToDevice();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeEventOnConnectToDevice);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent.onConnectToDevice()';
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


class HomeEventOnDeviceSelected implements HomeEvent {
  const HomeEventOnDeviceSelected({required this.device});
  

 final  Device device;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeEventOnDeviceSelectedCopyWith<HomeEventOnDeviceSelected> get copyWith => _$HomeEventOnDeviceSelectedCopyWithImpl<HomeEventOnDeviceSelected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeEventOnDeviceSelected&&(identical(other.device, device) || other.device == device));
}


@override
int get hashCode => Object.hash(runtimeType,device);

@override
String toString() {
  return 'HomeEvent.onDeviceSelected(device: $device)';
}


}

/// @nodoc
abstract mixin class $HomeEventOnDeviceSelectedCopyWith<$Res> implements $HomeEventCopyWith<$Res> {
  factory $HomeEventOnDeviceSelectedCopyWith(HomeEventOnDeviceSelected value, $Res Function(HomeEventOnDeviceSelected) _then) = _$HomeEventOnDeviceSelectedCopyWithImpl;
@useResult
$Res call({
 Device device
});




}
/// @nodoc
class _$HomeEventOnDeviceSelectedCopyWithImpl<$Res>
    implements $HomeEventOnDeviceSelectedCopyWith<$Res> {
  _$HomeEventOnDeviceSelectedCopyWithImpl(this._self, this._then);

  final HomeEventOnDeviceSelected _self;
  final $Res Function(HomeEventOnDeviceSelected) _then;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? device = null,}) {
  return _then(HomeEventOnDeviceSelected(
device: null == device ? _self.device : device // ignore: cast_nullable_to_non_nullable
as Device,
  ));
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


class HomeEventOnGameStarted implements HomeEvent {
  const HomeEventOnGameStarted({required this.opponent});
  

 final  User opponent;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeEventOnGameStartedCopyWith<HomeEventOnGameStarted> get copyWith => _$HomeEventOnGameStartedCopyWithImpl<HomeEventOnGameStarted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeEventOnGameStarted&&(identical(other.opponent, opponent) || other.opponent == opponent));
}


@override
int get hashCode => Object.hash(runtimeType,opponent);

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
 User opponent
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
@pragma('vm:prefer-inline') $Res call({Object? opponent = null,}) {
  return _then(HomeEventOnGameStarted(
opponent: null == opponent ? _self.opponent : opponent // ignore: cast_nullable_to_non_nullable
as User,
  ));
}


}

/// @nodoc


class HomeEventOnSendMessage implements HomeEvent {
  const HomeEventOnSendMessage({required this.content});
  

 final  String content;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeEventOnSendMessageCopyWith<HomeEventOnSendMessage> get copyWith => _$HomeEventOnSendMessageCopyWithImpl<HomeEventOnSendMessage>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeEventOnSendMessage&&(identical(other.content, content) || other.content == content));
}


@override
int get hashCode => Object.hash(runtimeType,content);

@override
String toString() {
  return 'HomeEvent.onSendMessage(content: $content)';
}


}

/// @nodoc
abstract mixin class $HomeEventOnSendMessageCopyWith<$Res> implements $HomeEventCopyWith<$Res> {
  factory $HomeEventOnSendMessageCopyWith(HomeEventOnSendMessage value, $Res Function(HomeEventOnSendMessage) _then) = _$HomeEventOnSendMessageCopyWithImpl;
@useResult
$Res call({
 String content
});




}
/// @nodoc
class _$HomeEventOnSendMessageCopyWithImpl<$Res>
    implements $HomeEventOnSendMessageCopyWith<$Res> {
  _$HomeEventOnSendMessageCopyWithImpl(this._self, this._then);

  final HomeEventOnSendMessage _self;
  final $Res Function(HomeEventOnSendMessage) _then;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? content = null,}) {
  return _then(HomeEventOnSendMessage(
content: null == content ? _self.content : content // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class HomeEventOnNavigateToMessageTest implements HomeEvent {
  const HomeEventOnNavigateToMessageTest();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeEventOnNavigateToMessageTest);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent.onNavigateToMessageTest()';
}


}




/// @nodoc


class HomeEventOnNavigateToConnectionTest implements HomeEvent {
  const HomeEventOnNavigateToConnectionTest();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeEventOnNavigateToConnectionTest);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent.onNavigateToConnectionTest()';
}


}




/// @nodoc


class HomeEventOnMessageReceived implements HomeEvent {
  const HomeEventOnMessageReceived({required this.message});
  

 final  Message message;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeEventOnMessageReceivedCopyWith<HomeEventOnMessageReceived> get copyWith => _$HomeEventOnMessageReceivedCopyWithImpl<HomeEventOnMessageReceived>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeEventOnMessageReceived&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'HomeEvent.onMessageReceived(message: $message)';
}


}

/// @nodoc
abstract mixin class $HomeEventOnMessageReceivedCopyWith<$Res> implements $HomeEventCopyWith<$Res> {
  factory $HomeEventOnMessageReceivedCopyWith(HomeEventOnMessageReceived value, $Res Function(HomeEventOnMessageReceived) _then) = _$HomeEventOnMessageReceivedCopyWithImpl;
@useResult
$Res call({
 Message message
});




}
/// @nodoc
class _$HomeEventOnMessageReceivedCopyWithImpl<$Res>
    implements $HomeEventOnMessageReceivedCopyWith<$Res> {
  _$HomeEventOnMessageReceivedCopyWithImpl(this._self, this._then);

  final HomeEventOnMessageReceived _self;
  final $Res Function(HomeEventOnMessageReceived) _then;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(HomeEventOnMessageReceived(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as Message,
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( HomeStateInitializationPending value)?  initializationPending,TResult Function( HomeStateInitializationError value)?  initializationError,TResult Function( HomeStateView value)?  view,TResult Function( HomeStateAwaitingConnection value)?  awaitingConnection,TResult Function( HomeStateSearchingDevices value)?  searchingDevices,TResult Function( HomeStateInvitationPending value)?  invitationPending,TResult Function( HomeStateInvitationReceived value)?  invitationReceived,TResult Function( HomeStateInvitationRejected value)?  invitationRejected,TResult Function( HomeStateGameStarted value)?  gameStarted,TResult Function( HomeStateMessageTestView value)?  messageTestView,TResult Function( HomeStateMessageReceived value)?  messageReceived,TResult Function( HomeStateMessageSent value)?  messageSent,TResult Function( HomeStateConnectionError value)?  connectionError,required TResult orElse(),}){
final _that = this;
switch (_that) {
case HomeStateInitializationPending() when initializationPending != null:
return initializationPending(_that);case HomeStateInitializationError() when initializationError != null:
return initializationError(_that);case HomeStateView() when view != null:
return view(_that);case HomeStateAwaitingConnection() when awaitingConnection != null:
return awaitingConnection(_that);case HomeStateSearchingDevices() when searchingDevices != null:
return searchingDevices(_that);case HomeStateInvitationPending() when invitationPending != null:
return invitationPending(_that);case HomeStateInvitationReceived() when invitationReceived != null:
return invitationReceived(_that);case HomeStateInvitationRejected() when invitationRejected != null:
return invitationRejected(_that);case HomeStateGameStarted() when gameStarted != null:
return gameStarted(_that);case HomeStateMessageTestView() when messageTestView != null:
return messageTestView(_that);case HomeStateMessageReceived() when messageReceived != null:
return messageReceived(_that);case HomeStateMessageSent() when messageSent != null:
return messageSent(_that);case HomeStateConnectionError() when connectionError != null:
return connectionError(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( HomeStateInitializationPending value)  initializationPending,required TResult Function( HomeStateInitializationError value)  initializationError,required TResult Function( HomeStateView value)  view,required TResult Function( HomeStateAwaitingConnection value)  awaitingConnection,required TResult Function( HomeStateSearchingDevices value)  searchingDevices,required TResult Function( HomeStateInvitationPending value)  invitationPending,required TResult Function( HomeStateInvitationReceived value)  invitationReceived,required TResult Function( HomeStateInvitationRejected value)  invitationRejected,required TResult Function( HomeStateGameStarted value)  gameStarted,required TResult Function( HomeStateMessageTestView value)  messageTestView,required TResult Function( HomeStateMessageReceived value)  messageReceived,required TResult Function( HomeStateMessageSent value)  messageSent,required TResult Function( HomeStateConnectionError value)  connectionError,}){
final _that = this;
switch (_that) {
case HomeStateInitializationPending():
return initializationPending(_that);case HomeStateInitializationError():
return initializationError(_that);case HomeStateView():
return view(_that);case HomeStateAwaitingConnection():
return awaitingConnection(_that);case HomeStateSearchingDevices():
return searchingDevices(_that);case HomeStateInvitationPending():
return invitationPending(_that);case HomeStateInvitationReceived():
return invitationReceived(_that);case HomeStateInvitationRejected():
return invitationRejected(_that);case HomeStateGameStarted():
return gameStarted(_that);case HomeStateMessageTestView():
return messageTestView(_that);case HomeStateMessageReceived():
return messageReceived(_that);case HomeStateMessageSent():
return messageSent(_that);case HomeStateConnectionError():
return connectionError(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( HomeStateInitializationPending value)?  initializationPending,TResult? Function( HomeStateInitializationError value)?  initializationError,TResult? Function( HomeStateView value)?  view,TResult? Function( HomeStateAwaitingConnection value)?  awaitingConnection,TResult? Function( HomeStateSearchingDevices value)?  searchingDevices,TResult? Function( HomeStateInvitationPending value)?  invitationPending,TResult? Function( HomeStateInvitationReceived value)?  invitationReceived,TResult? Function( HomeStateInvitationRejected value)?  invitationRejected,TResult? Function( HomeStateGameStarted value)?  gameStarted,TResult? Function( HomeStateMessageTestView value)?  messageTestView,TResult? Function( HomeStateMessageReceived value)?  messageReceived,TResult? Function( HomeStateMessageSent value)?  messageSent,TResult? Function( HomeStateConnectionError value)?  connectionError,}){
final _that = this;
switch (_that) {
case HomeStateInitializationPending() when initializationPending != null:
return initializationPending(_that);case HomeStateInitializationError() when initializationError != null:
return initializationError(_that);case HomeStateView() when view != null:
return view(_that);case HomeStateAwaitingConnection() when awaitingConnection != null:
return awaitingConnection(_that);case HomeStateSearchingDevices() when searchingDevices != null:
return searchingDevices(_that);case HomeStateInvitationPending() when invitationPending != null:
return invitationPending(_that);case HomeStateInvitationReceived() when invitationReceived != null:
return invitationReceived(_that);case HomeStateInvitationRejected() when invitationRejected != null:
return invitationRejected(_that);case HomeStateGameStarted() when gameStarted != null:
return gameStarted(_that);case HomeStateMessageTestView() when messageTestView != null:
return messageTestView(_that);case HomeStateMessageReceived() when messageReceived != null:
return messageReceived(_that);case HomeStateMessageSent() when messageSent != null:
return messageSent(_that);case HomeStateConnectionError() when connectionError != null:
return connectionError(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initializationPending,TResult Function( String message)?  initializationError,TResult Function()?  view,TResult Function()?  awaitingConnection,TResult Function( List<Device> devices,  Device? selectedDevice)?  searchingDevices,TResult Function( Device invitedDevice)?  invitationPending,TResult Function( User invitingUser)?  invitationReceived,TResult Function( User rejectedUser)?  invitationRejected,TResult Function( User opponent,  PlayerType myPlayerType)?  gameStarted,TResult Function()?  messageTestView,TResult Function( Message message)?  messageReceived,TResult Function()?  messageSent,TResult Function( String message)?  connectionError,required TResult orElse(),}) {final _that = this;
switch (_that) {
case HomeStateInitializationPending() when initializationPending != null:
return initializationPending();case HomeStateInitializationError() when initializationError != null:
return initializationError(_that.message);case HomeStateView() when view != null:
return view();case HomeStateAwaitingConnection() when awaitingConnection != null:
return awaitingConnection();case HomeStateSearchingDevices() when searchingDevices != null:
return searchingDevices(_that.devices,_that.selectedDevice);case HomeStateInvitationPending() when invitationPending != null:
return invitationPending(_that.invitedDevice);case HomeStateInvitationReceived() when invitationReceived != null:
return invitationReceived(_that.invitingUser);case HomeStateInvitationRejected() when invitationRejected != null:
return invitationRejected(_that.rejectedUser);case HomeStateGameStarted() when gameStarted != null:
return gameStarted(_that.opponent,_that.myPlayerType);case HomeStateMessageTestView() when messageTestView != null:
return messageTestView();case HomeStateMessageReceived() when messageReceived != null:
return messageReceived(_that.message);case HomeStateMessageSent() when messageSent != null:
return messageSent();case HomeStateConnectionError() when connectionError != null:
return connectionError(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initializationPending,required TResult Function( String message)  initializationError,required TResult Function()  view,required TResult Function()  awaitingConnection,required TResult Function( List<Device> devices,  Device? selectedDevice)  searchingDevices,required TResult Function( Device invitedDevice)  invitationPending,required TResult Function( User invitingUser)  invitationReceived,required TResult Function( User rejectedUser)  invitationRejected,required TResult Function( User opponent,  PlayerType myPlayerType)  gameStarted,required TResult Function()  messageTestView,required TResult Function( Message message)  messageReceived,required TResult Function()  messageSent,required TResult Function( String message)  connectionError,}) {final _that = this;
switch (_that) {
case HomeStateInitializationPending():
return initializationPending();case HomeStateInitializationError():
return initializationError(_that.message);case HomeStateView():
return view();case HomeStateAwaitingConnection():
return awaitingConnection();case HomeStateSearchingDevices():
return searchingDevices(_that.devices,_that.selectedDevice);case HomeStateInvitationPending():
return invitationPending(_that.invitedDevice);case HomeStateInvitationReceived():
return invitationReceived(_that.invitingUser);case HomeStateInvitationRejected():
return invitationRejected(_that.rejectedUser);case HomeStateGameStarted():
return gameStarted(_that.opponent,_that.myPlayerType);case HomeStateMessageTestView():
return messageTestView();case HomeStateMessageReceived():
return messageReceived(_that.message);case HomeStateMessageSent():
return messageSent();case HomeStateConnectionError():
return connectionError(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initializationPending,TResult? Function( String message)?  initializationError,TResult? Function()?  view,TResult? Function()?  awaitingConnection,TResult? Function( List<Device> devices,  Device? selectedDevice)?  searchingDevices,TResult? Function( Device invitedDevice)?  invitationPending,TResult? Function( User invitingUser)?  invitationReceived,TResult? Function( User rejectedUser)?  invitationRejected,TResult? Function( User opponent,  PlayerType myPlayerType)?  gameStarted,TResult? Function()?  messageTestView,TResult? Function( Message message)?  messageReceived,TResult? Function()?  messageSent,TResult? Function( String message)?  connectionError,}) {final _that = this;
switch (_that) {
case HomeStateInitializationPending() when initializationPending != null:
return initializationPending();case HomeStateInitializationError() when initializationError != null:
return initializationError(_that.message);case HomeStateView() when view != null:
return view();case HomeStateAwaitingConnection() when awaitingConnection != null:
return awaitingConnection();case HomeStateSearchingDevices() when searchingDevices != null:
return searchingDevices(_that.devices,_that.selectedDevice);case HomeStateInvitationPending() when invitationPending != null:
return invitationPending(_that.invitedDevice);case HomeStateInvitationReceived() when invitationReceived != null:
return invitationReceived(_that.invitingUser);case HomeStateInvitationRejected() when invitationRejected != null:
return invitationRejected(_that.rejectedUser);case HomeStateGameStarted() when gameStarted != null:
return gameStarted(_that.opponent,_that.myPlayerType);case HomeStateMessageTestView() when messageTestView != null:
return messageTestView();case HomeStateMessageReceived() when messageReceived != null:
return messageReceived(_that.message);case HomeStateMessageSent() when messageSent != null:
return messageSent();case HomeStateConnectionError() when connectionError != null:
return connectionError(_that.message);case _:
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


class HomeStateAwaitingConnection implements HomeState {
  const HomeStateAwaitingConnection();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeStateAwaitingConnection);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeState.awaitingConnection()';
}


}




/// @nodoc


class HomeStateSearchingDevices implements HomeState {
  const HomeStateSearchingDevices({required final  List<Device> devices, this.selectedDevice}): _devices = devices;
  

 final  List<Device> _devices;
 List<Device> get devices {
  if (_devices is EqualUnmodifiableListView) return _devices;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_devices);
}

 final  Device? selectedDevice;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeStateSearchingDevicesCopyWith<HomeStateSearchingDevices> get copyWith => _$HomeStateSearchingDevicesCopyWithImpl<HomeStateSearchingDevices>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeStateSearchingDevices&&const DeepCollectionEquality().equals(other._devices, _devices)&&(identical(other.selectedDevice, selectedDevice) || other.selectedDevice == selectedDevice));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_devices),selectedDevice);

@override
String toString() {
  return 'HomeState.searchingDevices(devices: $devices, selectedDevice: $selectedDevice)';
}


}

/// @nodoc
abstract mixin class $HomeStateSearchingDevicesCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory $HomeStateSearchingDevicesCopyWith(HomeStateSearchingDevices value, $Res Function(HomeStateSearchingDevices) _then) = _$HomeStateSearchingDevicesCopyWithImpl;
@useResult
$Res call({
 List<Device> devices, Device? selectedDevice
});




}
/// @nodoc
class _$HomeStateSearchingDevicesCopyWithImpl<$Res>
    implements $HomeStateSearchingDevicesCopyWith<$Res> {
  _$HomeStateSearchingDevicesCopyWithImpl(this._self, this._then);

  final HomeStateSearchingDevices _self;
  final $Res Function(HomeStateSearchingDevices) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? devices = null,Object? selectedDevice = freezed,}) {
  return _then(HomeStateSearchingDevices(
devices: null == devices ? _self._devices : devices // ignore: cast_nullable_to_non_nullable
as List<Device>,selectedDevice: freezed == selectedDevice ? _self.selectedDevice : selectedDevice // ignore: cast_nullable_to_non_nullable
as Device?,
  ));
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


class HomeStateGameStarted implements HomeState {
  const HomeStateGameStarted({required this.opponent, required this.myPlayerType});
  

 final  User opponent;
 final  PlayerType myPlayerType;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeStateGameStartedCopyWith<HomeStateGameStarted> get copyWith => _$HomeStateGameStartedCopyWithImpl<HomeStateGameStarted>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeStateGameStarted&&(identical(other.opponent, opponent) || other.opponent == opponent)&&(identical(other.myPlayerType, myPlayerType) || other.myPlayerType == myPlayerType));
}


@override
int get hashCode => Object.hash(runtimeType,opponent,myPlayerType);

@override
String toString() {
  return 'HomeState.gameStarted(opponent: $opponent, myPlayerType: $myPlayerType)';
}


}

/// @nodoc
abstract mixin class $HomeStateGameStartedCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory $HomeStateGameStartedCopyWith(HomeStateGameStarted value, $Res Function(HomeStateGameStarted) _then) = _$HomeStateGameStartedCopyWithImpl;
@useResult
$Res call({
 User opponent, PlayerType myPlayerType
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
@pragma('vm:prefer-inline') $Res call({Object? opponent = null,Object? myPlayerType = null,}) {
  return _then(HomeStateGameStarted(
opponent: null == opponent ? _self.opponent : opponent // ignore: cast_nullable_to_non_nullable
as User,myPlayerType: null == myPlayerType ? _self.myPlayerType : myPlayerType // ignore: cast_nullable_to_non_nullable
as PlayerType,
  ));
}


}

/// @nodoc


class HomeStateMessageTestView implements HomeState {
  const HomeStateMessageTestView();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeStateMessageTestView);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeState.messageTestView()';
}


}




/// @nodoc


class HomeStateMessageReceived implements HomeState {
  const HomeStateMessageReceived({required this.message});
  

 final  Message message;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeStateMessageReceivedCopyWith<HomeStateMessageReceived> get copyWith => _$HomeStateMessageReceivedCopyWithImpl<HomeStateMessageReceived>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeStateMessageReceived&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'HomeState.messageReceived(message: $message)';
}


}

/// @nodoc
abstract mixin class $HomeStateMessageReceivedCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory $HomeStateMessageReceivedCopyWith(HomeStateMessageReceived value, $Res Function(HomeStateMessageReceived) _then) = _$HomeStateMessageReceivedCopyWithImpl;
@useResult
$Res call({
 Message message
});




}
/// @nodoc
class _$HomeStateMessageReceivedCopyWithImpl<$Res>
    implements $HomeStateMessageReceivedCopyWith<$Res> {
  _$HomeStateMessageReceivedCopyWithImpl(this._self, this._then);

  final HomeStateMessageReceived _self;
  final $Res Function(HomeStateMessageReceived) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(HomeStateMessageReceived(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as Message,
  ));
}


}

/// @nodoc


class HomeStateMessageSent implements HomeState {
  const HomeStateMessageSent();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeStateMessageSent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeState.messageSent()';
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

// dart format on
