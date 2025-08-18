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
mixin _$HomeEvent implements DiagnosticableTreeMixin {




@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'HomeEvent'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( HomeEventOnInitializationRequested value)?  onInitializationRequested,TResult Function( HomeEventOnRefreshRequested value)?  onRefreshRequested,TResult Function( HomeEventOnDeviceSelected value)?  onDeviceSelected,TResult Function( HomeEventOnInvite value)?  onInvite,TResult Function( HomeEventOnCancelInvitation value)?  onCancelInvitation,TResult Function( HomeEventOnAcceptInvitation value)?  onAcceptInvitation,TResult Function( HomeEventOnRejectInvitation value)?  onRejectInvitation,TResult Function( HomeEventOnNicknameSaved value)?  onNicknameSaved,TResult Function( HomeEventOnViewStateChanged value)?  onViewStateChanged,TResult Function( HomeEventOnInvitationReceived value)?  onInvitationReceived,TResult Function( HomeEventOnInvitationRejected value)?  onInvitationRejected,TResult Function( HomeEventOnGameStarted value)?  onGameStarted,TResult Function( HomeEventOnSearchDevicesRequested value)?  onSearchDevicesRequested,TResult Function( HomeEventOnStartAdvertisingRequested value)?  onStartAdvertisingRequested,TResult Function( HomeEventOnDisconnectRequested value)?  onDisconnectRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case HomeEventOnInitializationRequested() when onInitializationRequested != null:
return onInitializationRequested(_that);case HomeEventOnRefreshRequested() when onRefreshRequested != null:
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
return onGameStarted(_that);case HomeEventOnSearchDevicesRequested() when onSearchDevicesRequested != null:
return onSearchDevicesRequested(_that);case HomeEventOnStartAdvertisingRequested() when onStartAdvertisingRequested != null:
return onStartAdvertisingRequested(_that);case HomeEventOnDisconnectRequested() when onDisconnectRequested != null:
return onDisconnectRequested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( HomeEventOnInitializationRequested value)  onInitializationRequested,required TResult Function( HomeEventOnRefreshRequested value)  onRefreshRequested,required TResult Function( HomeEventOnDeviceSelected value)  onDeviceSelected,required TResult Function( HomeEventOnInvite value)  onInvite,required TResult Function( HomeEventOnCancelInvitation value)  onCancelInvitation,required TResult Function( HomeEventOnAcceptInvitation value)  onAcceptInvitation,required TResult Function( HomeEventOnRejectInvitation value)  onRejectInvitation,required TResult Function( HomeEventOnNicknameSaved value)  onNicknameSaved,required TResult Function( HomeEventOnViewStateChanged value)  onViewStateChanged,required TResult Function( HomeEventOnInvitationReceived value)  onInvitationReceived,required TResult Function( HomeEventOnInvitationRejected value)  onInvitationRejected,required TResult Function( HomeEventOnGameStarted value)  onGameStarted,required TResult Function( HomeEventOnSearchDevicesRequested value)  onSearchDevicesRequested,required TResult Function( HomeEventOnStartAdvertisingRequested value)  onStartAdvertisingRequested,required TResult Function( HomeEventOnDisconnectRequested value)  onDisconnectRequested,}){
final _that = this;
switch (_that) {
case HomeEventOnInitializationRequested():
return onInitializationRequested(_that);case HomeEventOnRefreshRequested():
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
return onGameStarted(_that);case HomeEventOnSearchDevicesRequested():
return onSearchDevicesRequested(_that);case HomeEventOnStartAdvertisingRequested():
return onStartAdvertisingRequested(_that);case HomeEventOnDisconnectRequested():
return onDisconnectRequested(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( HomeEventOnInitializationRequested value)?  onInitializationRequested,TResult? Function( HomeEventOnRefreshRequested value)?  onRefreshRequested,TResult? Function( HomeEventOnDeviceSelected value)?  onDeviceSelected,TResult? Function( HomeEventOnInvite value)?  onInvite,TResult? Function( HomeEventOnCancelInvitation value)?  onCancelInvitation,TResult? Function( HomeEventOnAcceptInvitation value)?  onAcceptInvitation,TResult? Function( HomeEventOnRejectInvitation value)?  onRejectInvitation,TResult? Function( HomeEventOnNicknameSaved value)?  onNicknameSaved,TResult? Function( HomeEventOnViewStateChanged value)?  onViewStateChanged,TResult? Function( HomeEventOnInvitationReceived value)?  onInvitationReceived,TResult? Function( HomeEventOnInvitationRejected value)?  onInvitationRejected,TResult? Function( HomeEventOnGameStarted value)?  onGameStarted,TResult? Function( HomeEventOnSearchDevicesRequested value)?  onSearchDevicesRequested,TResult? Function( HomeEventOnStartAdvertisingRequested value)?  onStartAdvertisingRequested,TResult? Function( HomeEventOnDisconnectRequested value)?  onDisconnectRequested,}){
final _that = this;
switch (_that) {
case HomeEventOnInitializationRequested() when onInitializationRequested != null:
return onInitializationRequested(_that);case HomeEventOnRefreshRequested() when onRefreshRequested != null:
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
return onGameStarted(_that);case HomeEventOnSearchDevicesRequested() when onSearchDevicesRequested != null:
return onSearchDevicesRequested(_that);case HomeEventOnStartAdvertisingRequested() when onStartAdvertisingRequested != null:
return onStartAdvertisingRequested(_that);case HomeEventOnDisconnectRequested() when onDisconnectRequested != null:
return onDisconnectRequested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  onInitializationRequested,TResult Function()?  onRefreshRequested,TResult Function( Device device)?  onDeviceSelected,TResult Function()?  onInvite,TResult Function()?  onCancelInvitation,TResult Function()?  onAcceptInvitation,TResult Function()?  onRejectInvitation,TResult Function( String nickname)?  onNicknameSaved,TResult Function()?  onViewStateChanged,TResult Function( User invitingUser)?  onInvitationReceived,TResult Function( User rejectedUser)?  onInvitationRejected,TResult Function( User opponent)?  onGameStarted,TResult Function()?  onSearchDevicesRequested,TResult Function()?  onStartAdvertisingRequested,TResult Function()?  onDisconnectRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case HomeEventOnInitializationRequested() when onInitializationRequested != null:
return onInitializationRequested();case HomeEventOnRefreshRequested() when onRefreshRequested != null:
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
return onGameStarted(_that.opponent);case HomeEventOnSearchDevicesRequested() when onSearchDevicesRequested != null:
return onSearchDevicesRequested();case HomeEventOnStartAdvertisingRequested() when onStartAdvertisingRequested != null:
return onStartAdvertisingRequested();case HomeEventOnDisconnectRequested() when onDisconnectRequested != null:
return onDisconnectRequested();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  onInitializationRequested,required TResult Function()  onRefreshRequested,required TResult Function( Device device)  onDeviceSelected,required TResult Function()  onInvite,required TResult Function()  onCancelInvitation,required TResult Function()  onAcceptInvitation,required TResult Function()  onRejectInvitation,required TResult Function( String nickname)  onNicknameSaved,required TResult Function()  onViewStateChanged,required TResult Function( User invitingUser)  onInvitationReceived,required TResult Function( User rejectedUser)  onInvitationRejected,required TResult Function( User opponent)  onGameStarted,required TResult Function()  onSearchDevicesRequested,required TResult Function()  onStartAdvertisingRequested,required TResult Function()  onDisconnectRequested,}) {final _that = this;
switch (_that) {
case HomeEventOnInitializationRequested():
return onInitializationRequested();case HomeEventOnRefreshRequested():
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
return onGameStarted(_that.opponent);case HomeEventOnSearchDevicesRequested():
return onSearchDevicesRequested();case HomeEventOnStartAdvertisingRequested():
return onStartAdvertisingRequested();case HomeEventOnDisconnectRequested():
return onDisconnectRequested();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  onInitializationRequested,TResult? Function()?  onRefreshRequested,TResult? Function( Device device)?  onDeviceSelected,TResult? Function()?  onInvite,TResult? Function()?  onCancelInvitation,TResult? Function()?  onAcceptInvitation,TResult? Function()?  onRejectInvitation,TResult? Function( String nickname)?  onNicknameSaved,TResult? Function()?  onViewStateChanged,TResult? Function( User invitingUser)?  onInvitationReceived,TResult? Function( User rejectedUser)?  onInvitationRejected,TResult? Function( User opponent)?  onGameStarted,TResult? Function()?  onSearchDevicesRequested,TResult? Function()?  onStartAdvertisingRequested,TResult? Function()?  onDisconnectRequested,}) {final _that = this;
switch (_that) {
case HomeEventOnInitializationRequested() when onInitializationRequested != null:
return onInitializationRequested();case HomeEventOnRefreshRequested() when onRefreshRequested != null:
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
return onGameStarted(_that.opponent);case HomeEventOnSearchDevicesRequested() when onSearchDevicesRequested != null:
return onSearchDevicesRequested();case HomeEventOnStartAdvertisingRequested() when onStartAdvertisingRequested != null:
return onStartAdvertisingRequested();case HomeEventOnDisconnectRequested() when onDisconnectRequested != null:
return onDisconnectRequested();case _:
  return null;

}
}

}

/// @nodoc


class HomeEventOnInitializationRequested with DiagnosticableTreeMixin implements HomeEvent {
  const HomeEventOnInitializationRequested();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'HomeEvent.onInitializationRequested'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeEventOnInitializationRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'HomeEvent.onInitializationRequested()';
}


}




/// @nodoc


class HomeEventOnRefreshRequested with DiagnosticableTreeMixin implements HomeEvent {
  const HomeEventOnRefreshRequested();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'HomeEvent.onRefreshRequested'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeEventOnRefreshRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'HomeEvent.onRefreshRequested()';
}


}




/// @nodoc


class HomeEventOnDeviceSelected with DiagnosticableTreeMixin implements HomeEvent {
  const HomeEventOnDeviceSelected({required this.device});
  

 final  Device device;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeEventOnDeviceSelectedCopyWith<HomeEventOnDeviceSelected> get copyWith => _$HomeEventOnDeviceSelectedCopyWithImpl<HomeEventOnDeviceSelected>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'HomeEvent.onDeviceSelected'))
    ..add(DiagnosticsProperty('device', device));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeEventOnDeviceSelected&&(identical(other.device, device) || other.device == device));
}


@override
int get hashCode => Object.hash(runtimeType,device);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
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


class HomeEventOnInvite with DiagnosticableTreeMixin implements HomeEvent {
  const HomeEventOnInvite();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'HomeEvent.onInvite'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeEventOnInvite);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'HomeEvent.onInvite()';
}


}




/// @nodoc


class HomeEventOnCancelInvitation with DiagnosticableTreeMixin implements HomeEvent {
  const HomeEventOnCancelInvitation();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'HomeEvent.onCancelInvitation'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeEventOnCancelInvitation);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'HomeEvent.onCancelInvitation()';
}


}




/// @nodoc


class HomeEventOnAcceptInvitation with DiagnosticableTreeMixin implements HomeEvent {
  const HomeEventOnAcceptInvitation();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'HomeEvent.onAcceptInvitation'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeEventOnAcceptInvitation);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'HomeEvent.onAcceptInvitation()';
}


}




/// @nodoc


class HomeEventOnRejectInvitation with DiagnosticableTreeMixin implements HomeEvent {
  const HomeEventOnRejectInvitation();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'HomeEvent.onRejectInvitation'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeEventOnRejectInvitation);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'HomeEvent.onRejectInvitation()';
}


}




/// @nodoc


class HomeEventOnNicknameSaved with DiagnosticableTreeMixin implements HomeEvent {
  const HomeEventOnNicknameSaved({required this.nickname});
  

 final  String nickname;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeEventOnNicknameSavedCopyWith<HomeEventOnNicknameSaved> get copyWith => _$HomeEventOnNicknameSavedCopyWithImpl<HomeEventOnNicknameSaved>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'HomeEvent.onNicknameSaved'))
    ..add(DiagnosticsProperty('nickname', nickname));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeEventOnNicknameSaved&&(identical(other.nickname, nickname) || other.nickname == nickname));
}


@override
int get hashCode => Object.hash(runtimeType,nickname);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
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


class HomeEventOnViewStateChanged with DiagnosticableTreeMixin implements HomeEvent {
  const HomeEventOnViewStateChanged();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'HomeEvent.onViewStateChanged'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeEventOnViewStateChanged);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'HomeEvent.onViewStateChanged()';
}


}




/// @nodoc


class HomeEventOnInvitationReceived with DiagnosticableTreeMixin implements HomeEvent {
  const HomeEventOnInvitationReceived({required this.invitingUser});
  

 final  User invitingUser;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeEventOnInvitationReceivedCopyWith<HomeEventOnInvitationReceived> get copyWith => _$HomeEventOnInvitationReceivedCopyWithImpl<HomeEventOnInvitationReceived>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'HomeEvent.onInvitationReceived'))
    ..add(DiagnosticsProperty('invitingUser', invitingUser));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeEventOnInvitationReceived&&(identical(other.invitingUser, invitingUser) || other.invitingUser == invitingUser));
}


@override
int get hashCode => Object.hash(runtimeType,invitingUser);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
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


class HomeEventOnInvitationRejected with DiagnosticableTreeMixin implements HomeEvent {
  const HomeEventOnInvitationRejected({required this.rejectedUser});
  

 final  User rejectedUser;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeEventOnInvitationRejectedCopyWith<HomeEventOnInvitationRejected> get copyWith => _$HomeEventOnInvitationRejectedCopyWithImpl<HomeEventOnInvitationRejected>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'HomeEvent.onInvitationRejected'))
    ..add(DiagnosticsProperty('rejectedUser', rejectedUser));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeEventOnInvitationRejected&&(identical(other.rejectedUser, rejectedUser) || other.rejectedUser == rejectedUser));
}


@override
int get hashCode => Object.hash(runtimeType,rejectedUser);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
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


class HomeEventOnGameStarted with DiagnosticableTreeMixin implements HomeEvent {
  const HomeEventOnGameStarted({required this.opponent});
  

 final  User opponent;

/// Create a copy of HomeEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeEventOnGameStartedCopyWith<HomeEventOnGameStarted> get copyWith => _$HomeEventOnGameStartedCopyWithImpl<HomeEventOnGameStarted>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'HomeEvent.onGameStarted'))
    ..add(DiagnosticsProperty('opponent', opponent));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeEventOnGameStarted&&(identical(other.opponent, opponent) || other.opponent == opponent));
}


@override
int get hashCode => Object.hash(runtimeType,opponent);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
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


class HomeEventOnSearchDevicesRequested with DiagnosticableTreeMixin implements HomeEvent {
  const HomeEventOnSearchDevicesRequested();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'HomeEvent.onSearchDevicesRequested'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeEventOnSearchDevicesRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'HomeEvent.onSearchDevicesRequested()';
}


}




/// @nodoc


class HomeEventOnStartAdvertisingRequested with DiagnosticableTreeMixin implements HomeEvent {
  const HomeEventOnStartAdvertisingRequested();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'HomeEvent.onStartAdvertisingRequested'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeEventOnStartAdvertisingRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'HomeEvent.onStartAdvertisingRequested()';
}


}




/// @nodoc


class HomeEventOnDisconnectRequested with DiagnosticableTreeMixin implements HomeEvent {
  const HomeEventOnDisconnectRequested();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'HomeEvent.onDisconnectRequested'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeEventOnDisconnectRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'HomeEvent.onDisconnectRequested()';
}


}




/// @nodoc
mixin _$HomeState implements DiagnosticableTreeMixin {




@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'HomeState'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initializationPending,TResult Function( String message)?  initializationError,TResult Function( List<Device> devices,  Device? selectedDevice,  bool isFirstLaunch,  bool isConnected)?  view,TResult Function( Device invitedDevice)?  invitationPending,TResult Function( User invitingUser)?  invitationReceived,TResult Function( User rejectedUser)?  invitationRejected,TResult Function( User opponent,  PlayerType myPlayerType)?  gameStarted,required TResult orElse(),}) {final _that = this;
switch (_that) {
case HomeStateInitializationPending() when initializationPending != null:
return initializationPending();case HomeStateInitializationError() when initializationError != null:
return initializationError(_that.message);case HomeStateView() when view != null:
return view(_that.devices,_that.selectedDevice,_that.isFirstLaunch,_that.isConnected);case HomeStateInvitationPending() when invitationPending != null:
return invitationPending(_that.invitedDevice);case HomeStateInvitationReceived() when invitationReceived != null:
return invitationReceived(_that.invitingUser);case HomeStateInvitationRejected() when invitationRejected != null:
return invitationRejected(_that.rejectedUser);case HomeStateGameStarted() when gameStarted != null:
return gameStarted(_that.opponent,_that.myPlayerType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initializationPending,required TResult Function( String message)  initializationError,required TResult Function( List<Device> devices,  Device? selectedDevice,  bool isFirstLaunch,  bool isConnected)  view,required TResult Function( Device invitedDevice)  invitationPending,required TResult Function( User invitingUser)  invitationReceived,required TResult Function( User rejectedUser)  invitationRejected,required TResult Function( User opponent,  PlayerType myPlayerType)  gameStarted,}) {final _that = this;
switch (_that) {
case HomeStateInitializationPending():
return initializationPending();case HomeStateInitializationError():
return initializationError(_that.message);case HomeStateView():
return view(_that.devices,_that.selectedDevice,_that.isFirstLaunch,_that.isConnected);case HomeStateInvitationPending():
return invitationPending(_that.invitedDevice);case HomeStateInvitationReceived():
return invitationReceived(_that.invitingUser);case HomeStateInvitationRejected():
return invitationRejected(_that.rejectedUser);case HomeStateGameStarted():
return gameStarted(_that.opponent,_that.myPlayerType);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initializationPending,TResult? Function( String message)?  initializationError,TResult? Function( List<Device> devices,  Device? selectedDevice,  bool isFirstLaunch,  bool isConnected)?  view,TResult? Function( Device invitedDevice)?  invitationPending,TResult? Function( User invitingUser)?  invitationReceived,TResult? Function( User rejectedUser)?  invitationRejected,TResult? Function( User opponent,  PlayerType myPlayerType)?  gameStarted,}) {final _that = this;
switch (_that) {
case HomeStateInitializationPending() when initializationPending != null:
return initializationPending();case HomeStateInitializationError() when initializationError != null:
return initializationError(_that.message);case HomeStateView() when view != null:
return view(_that.devices,_that.selectedDevice,_that.isFirstLaunch,_that.isConnected);case HomeStateInvitationPending() when invitationPending != null:
return invitationPending(_that.invitedDevice);case HomeStateInvitationReceived() when invitationReceived != null:
return invitationReceived(_that.invitingUser);case HomeStateInvitationRejected() when invitationRejected != null:
return invitationRejected(_that.rejectedUser);case HomeStateGameStarted() when gameStarted != null:
return gameStarted(_that.opponent,_that.myPlayerType);case _:
  return null;

}
}

}

/// @nodoc


class HomeStateInitializationPending with DiagnosticableTreeMixin implements HomeState {
  const HomeStateInitializationPending();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'HomeState.initializationPending'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeStateInitializationPending);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'HomeState.initializationPending()';
}


}




/// @nodoc


class HomeStateInitializationError with DiagnosticableTreeMixin implements HomeState {
  const HomeStateInitializationError({required this.message});
  

 final  String message;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeStateInitializationErrorCopyWith<HomeStateInitializationError> get copyWith => _$HomeStateInitializationErrorCopyWithImpl<HomeStateInitializationError>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'HomeState.initializationError'))
    ..add(DiagnosticsProperty('message', message));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeStateInitializationError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
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


class HomeStateView with DiagnosticableTreeMixin implements HomeState {
  const HomeStateView({required final  List<Device> devices, this.selectedDevice, required this.isFirstLaunch, required this.isConnected}): _devices = devices;
  

 final  List<Device> _devices;
 List<Device> get devices {
  if (_devices is EqualUnmodifiableListView) return _devices;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_devices);
}

 final  Device? selectedDevice;
 final  bool isFirstLaunch;
 final  bool isConnected;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeStateViewCopyWith<HomeStateView> get copyWith => _$HomeStateViewCopyWithImpl<HomeStateView>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'HomeState.view'))
    ..add(DiagnosticsProperty('devices', devices))..add(DiagnosticsProperty('selectedDevice', selectedDevice))..add(DiagnosticsProperty('isFirstLaunch', isFirstLaunch))..add(DiagnosticsProperty('isConnected', isConnected));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeStateView&&const DeepCollectionEquality().equals(other._devices, _devices)&&(identical(other.selectedDevice, selectedDevice) || other.selectedDevice == selectedDevice)&&(identical(other.isFirstLaunch, isFirstLaunch) || other.isFirstLaunch == isFirstLaunch)&&(identical(other.isConnected, isConnected) || other.isConnected == isConnected));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_devices),selectedDevice,isFirstLaunch,isConnected);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'HomeState.view(devices: $devices, selectedDevice: $selectedDevice, isFirstLaunch: $isFirstLaunch, isConnected: $isConnected)';
}


}

/// @nodoc
abstract mixin class $HomeStateViewCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory $HomeStateViewCopyWith(HomeStateView value, $Res Function(HomeStateView) _then) = _$HomeStateViewCopyWithImpl;
@useResult
$Res call({
 List<Device> devices, Device? selectedDevice, bool isFirstLaunch, bool isConnected
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
@pragma('vm:prefer-inline') $Res call({Object? devices = null,Object? selectedDevice = freezed,Object? isFirstLaunch = null,Object? isConnected = null,}) {
  return _then(HomeStateView(
devices: null == devices ? _self._devices : devices // ignore: cast_nullable_to_non_nullable
as List<Device>,selectedDevice: freezed == selectedDevice ? _self.selectedDevice : selectedDevice // ignore: cast_nullable_to_non_nullable
as Device?,isFirstLaunch: null == isFirstLaunch ? _self.isFirstLaunch : isFirstLaunch // ignore: cast_nullable_to_non_nullable
as bool,isConnected: null == isConnected ? _self.isConnected : isConnected // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class HomeStateInvitationPending with DiagnosticableTreeMixin implements HomeState {
  const HomeStateInvitationPending({required this.invitedDevice});
  

 final  Device invitedDevice;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeStateInvitationPendingCopyWith<HomeStateInvitationPending> get copyWith => _$HomeStateInvitationPendingCopyWithImpl<HomeStateInvitationPending>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'HomeState.invitationPending'))
    ..add(DiagnosticsProperty('invitedDevice', invitedDevice));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeStateInvitationPending&&(identical(other.invitedDevice, invitedDevice) || other.invitedDevice == invitedDevice));
}


@override
int get hashCode => Object.hash(runtimeType,invitedDevice);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
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


class HomeStateInvitationReceived with DiagnosticableTreeMixin implements HomeState {
  const HomeStateInvitationReceived({required this.invitingUser});
  

 final  User invitingUser;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeStateInvitationReceivedCopyWith<HomeStateInvitationReceived> get copyWith => _$HomeStateInvitationReceivedCopyWithImpl<HomeStateInvitationReceived>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'HomeState.invitationReceived'))
    ..add(DiagnosticsProperty('invitingUser', invitingUser));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeStateInvitationReceived&&(identical(other.invitingUser, invitingUser) || other.invitingUser == invitingUser));
}


@override
int get hashCode => Object.hash(runtimeType,invitingUser);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
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


class HomeStateInvitationRejected with DiagnosticableTreeMixin implements HomeState {
  const HomeStateInvitationRejected({required this.rejectedUser});
  

 final  User rejectedUser;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeStateInvitationRejectedCopyWith<HomeStateInvitationRejected> get copyWith => _$HomeStateInvitationRejectedCopyWithImpl<HomeStateInvitationRejected>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'HomeState.invitationRejected'))
    ..add(DiagnosticsProperty('rejectedUser', rejectedUser));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeStateInvitationRejected&&(identical(other.rejectedUser, rejectedUser) || other.rejectedUser == rejectedUser));
}


@override
int get hashCode => Object.hash(runtimeType,rejectedUser);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
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


class HomeStateGameStarted with DiagnosticableTreeMixin implements HomeState {
  const HomeStateGameStarted({required this.opponent, required this.myPlayerType});
  

 final  User opponent;
 final  PlayerType myPlayerType;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeStateGameStartedCopyWith<HomeStateGameStarted> get copyWith => _$HomeStateGameStartedCopyWithImpl<HomeStateGameStarted>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'HomeState.gameStarted'))
    ..add(DiagnosticsProperty('opponent', opponent))..add(DiagnosticsProperty('myPlayerType', myPlayerType));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeStateGameStarted&&(identical(other.opponent, opponent) || other.opponent == opponent)&&(identical(other.myPlayerType, myPlayerType) || other.myPlayerType == myPlayerType));
}


@override
int get hashCode => Object.hash(runtimeType,opponent,myPlayerType);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
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

// dart format on
