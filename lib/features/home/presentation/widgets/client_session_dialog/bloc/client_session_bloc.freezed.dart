// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'client_session_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ClientSessionEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClientSessionEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ClientSessionEvent()';
}


}

/// @nodoc
class $ClientSessionEventCopyWith<$Res>  {
$ClientSessionEventCopyWith(ClientSessionEvent _, $Res Function(ClientSessionEvent) __);
}


/// Adds pattern-matching-related methods to [ClientSessionEvent].
extension ClientSessionEventPatterns on ClientSessionEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ClientSessionEventOnViewStateChanged value)?  onViewStateChanged,TResult Function( ClientSessionEventOnInitializationRequested value)?  onInitializationRequested,TResult Function( ClientSessionEventOnConnectToDevice value)?  onConnectToDevice,TResult Function( ClientSessionEventOnRefreshRequested value)?  onRefreshRequested,TResult Function( ClientSessionEventOnDeviceSelected value)?  onDeviceSelected,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ClientSessionEventOnViewStateChanged() when onViewStateChanged != null:
return onViewStateChanged(_that);case ClientSessionEventOnInitializationRequested() when onInitializationRequested != null:
return onInitializationRequested(_that);case ClientSessionEventOnConnectToDevice() when onConnectToDevice != null:
return onConnectToDevice(_that);case ClientSessionEventOnRefreshRequested() when onRefreshRequested != null:
return onRefreshRequested(_that);case ClientSessionEventOnDeviceSelected() when onDeviceSelected != null:
return onDeviceSelected(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ClientSessionEventOnViewStateChanged value)  onViewStateChanged,required TResult Function( ClientSessionEventOnInitializationRequested value)  onInitializationRequested,required TResult Function( ClientSessionEventOnConnectToDevice value)  onConnectToDevice,required TResult Function( ClientSessionEventOnRefreshRequested value)  onRefreshRequested,required TResult Function( ClientSessionEventOnDeviceSelected value)  onDeviceSelected,}){
final _that = this;
switch (_that) {
case ClientSessionEventOnViewStateChanged():
return onViewStateChanged(_that);case ClientSessionEventOnInitializationRequested():
return onInitializationRequested(_that);case ClientSessionEventOnConnectToDevice():
return onConnectToDevice(_that);case ClientSessionEventOnRefreshRequested():
return onRefreshRequested(_that);case ClientSessionEventOnDeviceSelected():
return onDeviceSelected(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ClientSessionEventOnViewStateChanged value)?  onViewStateChanged,TResult? Function( ClientSessionEventOnInitializationRequested value)?  onInitializationRequested,TResult? Function( ClientSessionEventOnConnectToDevice value)?  onConnectToDevice,TResult? Function( ClientSessionEventOnRefreshRequested value)?  onRefreshRequested,TResult? Function( ClientSessionEventOnDeviceSelected value)?  onDeviceSelected,}){
final _that = this;
switch (_that) {
case ClientSessionEventOnViewStateChanged() when onViewStateChanged != null:
return onViewStateChanged(_that);case ClientSessionEventOnInitializationRequested() when onInitializationRequested != null:
return onInitializationRequested(_that);case ClientSessionEventOnConnectToDevice() when onConnectToDevice != null:
return onConnectToDevice(_that);case ClientSessionEventOnRefreshRequested() when onRefreshRequested != null:
return onRefreshRequested(_that);case ClientSessionEventOnDeviceSelected() when onDeviceSelected != null:
return onDeviceSelected(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  onViewStateChanged,TResult Function()?  onInitializationRequested,TResult Function()?  onConnectToDevice,TResult Function()?  onRefreshRequested,TResult Function( Device device)?  onDeviceSelected,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ClientSessionEventOnViewStateChanged() when onViewStateChanged != null:
return onViewStateChanged();case ClientSessionEventOnInitializationRequested() when onInitializationRequested != null:
return onInitializationRequested();case ClientSessionEventOnConnectToDevice() when onConnectToDevice != null:
return onConnectToDevice();case ClientSessionEventOnRefreshRequested() when onRefreshRequested != null:
return onRefreshRequested();case ClientSessionEventOnDeviceSelected() when onDeviceSelected != null:
return onDeviceSelected(_that.device);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  onViewStateChanged,required TResult Function()  onInitializationRequested,required TResult Function()  onConnectToDevice,required TResult Function()  onRefreshRequested,required TResult Function( Device device)  onDeviceSelected,}) {final _that = this;
switch (_that) {
case ClientSessionEventOnViewStateChanged():
return onViewStateChanged();case ClientSessionEventOnInitializationRequested():
return onInitializationRequested();case ClientSessionEventOnConnectToDevice():
return onConnectToDevice();case ClientSessionEventOnRefreshRequested():
return onRefreshRequested();case ClientSessionEventOnDeviceSelected():
return onDeviceSelected(_that.device);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  onViewStateChanged,TResult? Function()?  onInitializationRequested,TResult? Function()?  onConnectToDevice,TResult? Function()?  onRefreshRequested,TResult? Function( Device device)?  onDeviceSelected,}) {final _that = this;
switch (_that) {
case ClientSessionEventOnViewStateChanged() when onViewStateChanged != null:
return onViewStateChanged();case ClientSessionEventOnInitializationRequested() when onInitializationRequested != null:
return onInitializationRequested();case ClientSessionEventOnConnectToDevice() when onConnectToDevice != null:
return onConnectToDevice();case ClientSessionEventOnRefreshRequested() when onRefreshRequested != null:
return onRefreshRequested();case ClientSessionEventOnDeviceSelected() when onDeviceSelected != null:
return onDeviceSelected(_that.device);case _:
  return null;

}
}

}

/// @nodoc


class ClientSessionEventOnViewStateChanged implements ClientSessionEvent {
  const ClientSessionEventOnViewStateChanged();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClientSessionEventOnViewStateChanged);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ClientSessionEvent.onViewStateChanged()';
}


}




/// @nodoc


class ClientSessionEventOnInitializationRequested implements ClientSessionEvent {
  const ClientSessionEventOnInitializationRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClientSessionEventOnInitializationRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ClientSessionEvent.onInitializationRequested()';
}


}




/// @nodoc


class ClientSessionEventOnConnectToDevice implements ClientSessionEvent {
  const ClientSessionEventOnConnectToDevice();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClientSessionEventOnConnectToDevice);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ClientSessionEvent.onConnectToDevice()';
}


}




/// @nodoc


class ClientSessionEventOnRefreshRequested implements ClientSessionEvent {
  const ClientSessionEventOnRefreshRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClientSessionEventOnRefreshRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ClientSessionEvent.onRefreshRequested()';
}


}




/// @nodoc


class ClientSessionEventOnDeviceSelected implements ClientSessionEvent {
  const ClientSessionEventOnDeviceSelected({required this.device});
  

 final  Device device;

/// Create a copy of ClientSessionEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClientSessionEventOnDeviceSelectedCopyWith<ClientSessionEventOnDeviceSelected> get copyWith => _$ClientSessionEventOnDeviceSelectedCopyWithImpl<ClientSessionEventOnDeviceSelected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClientSessionEventOnDeviceSelected&&(identical(other.device, device) || other.device == device));
}


@override
int get hashCode => Object.hash(runtimeType,device);

@override
String toString() {
  return 'ClientSessionEvent.onDeviceSelected(device: $device)';
}


}

/// @nodoc
abstract mixin class $ClientSessionEventOnDeviceSelectedCopyWith<$Res> implements $ClientSessionEventCopyWith<$Res> {
  factory $ClientSessionEventOnDeviceSelectedCopyWith(ClientSessionEventOnDeviceSelected value, $Res Function(ClientSessionEventOnDeviceSelected) _then) = _$ClientSessionEventOnDeviceSelectedCopyWithImpl;
@useResult
$Res call({
 Device device
});




}
/// @nodoc
class _$ClientSessionEventOnDeviceSelectedCopyWithImpl<$Res>
    implements $ClientSessionEventOnDeviceSelectedCopyWith<$Res> {
  _$ClientSessionEventOnDeviceSelectedCopyWithImpl(this._self, this._then);

  final ClientSessionEventOnDeviceSelected _self;
  final $Res Function(ClientSessionEventOnDeviceSelected) _then;

/// Create a copy of ClientSessionEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? device = null,}) {
  return _then(ClientSessionEventOnDeviceSelected(
device: null == device ? _self.device : device // ignore: cast_nullable_to_non_nullable
as Device,
  ));
}


}

/// @nodoc
mixin _$ClientSessionState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClientSessionState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ClientSessionState()';
}


}

/// @nodoc
class $ClientSessionStateCopyWith<$Res>  {
$ClientSessionStateCopyWith(ClientSessionState _, $Res Function(ClientSessionState) __);
}


/// Adds pattern-matching-related methods to [ClientSessionState].
extension ClientSessionStatePatterns on ClientSessionState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ClientSessionStatePending value)?  pending,TResult Function( ClientSessionStateView value)?  view,TResult Function( ClientSessionStateError value)?  error,TResult Function( ClientSessionStateConnected value)?  connected,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ClientSessionStatePending() when pending != null:
return pending(_that);case ClientSessionStateView() when view != null:
return view(_that);case ClientSessionStateError() when error != null:
return error(_that);case ClientSessionStateConnected() when connected != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ClientSessionStatePending value)  pending,required TResult Function( ClientSessionStateView value)  view,required TResult Function( ClientSessionStateError value)  error,required TResult Function( ClientSessionStateConnected value)  connected,}){
final _that = this;
switch (_that) {
case ClientSessionStatePending():
return pending(_that);case ClientSessionStateView():
return view(_that);case ClientSessionStateError():
return error(_that);case ClientSessionStateConnected():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ClientSessionStatePending value)?  pending,TResult? Function( ClientSessionStateView value)?  view,TResult? Function( ClientSessionStateError value)?  error,TResult? Function( ClientSessionStateConnected value)?  connected,}){
final _that = this;
switch (_that) {
case ClientSessionStatePending() when pending != null:
return pending(_that);case ClientSessionStateView() when view != null:
return view(_that);case ClientSessionStateError() when error != null:
return error(_that);case ClientSessionStateConnected() when connected != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  pending,TResult Function( List<Device> devices,  Device? selectedDevice)?  view,TResult Function( String? message)?  error,TResult Function()?  connected,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ClientSessionStatePending() when pending != null:
return pending();case ClientSessionStateView() when view != null:
return view(_that.devices,_that.selectedDevice);case ClientSessionStateError() when error != null:
return error(_that.message);case ClientSessionStateConnected() when connected != null:
return connected();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  pending,required TResult Function( List<Device> devices,  Device? selectedDevice)  view,required TResult Function( String? message)  error,required TResult Function()  connected,}) {final _that = this;
switch (_that) {
case ClientSessionStatePending():
return pending();case ClientSessionStateView():
return view(_that.devices,_that.selectedDevice);case ClientSessionStateError():
return error(_that.message);case ClientSessionStateConnected():
return connected();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  pending,TResult? Function( List<Device> devices,  Device? selectedDevice)?  view,TResult? Function( String? message)?  error,TResult? Function()?  connected,}) {final _that = this;
switch (_that) {
case ClientSessionStatePending() when pending != null:
return pending();case ClientSessionStateView() when view != null:
return view(_that.devices,_that.selectedDevice);case ClientSessionStateError() when error != null:
return error(_that.message);case ClientSessionStateConnected() when connected != null:
return connected();case _:
  return null;

}
}

}

/// @nodoc


class ClientSessionStatePending implements ClientSessionState {
  const ClientSessionStatePending();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClientSessionStatePending);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ClientSessionState.pending()';
}


}




/// @nodoc


class ClientSessionStateView implements ClientSessionState {
  const ClientSessionStateView({final  List<Device> devices = const [], this.selectedDevice}): _devices = devices;
  

 final  List<Device> _devices;
@JsonKey() List<Device> get devices {
  if (_devices is EqualUnmodifiableListView) return _devices;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_devices);
}

 final  Device? selectedDevice;

/// Create a copy of ClientSessionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClientSessionStateViewCopyWith<ClientSessionStateView> get copyWith => _$ClientSessionStateViewCopyWithImpl<ClientSessionStateView>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClientSessionStateView&&const DeepCollectionEquality().equals(other._devices, _devices)&&(identical(other.selectedDevice, selectedDevice) || other.selectedDevice == selectedDevice));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_devices),selectedDevice);

@override
String toString() {
  return 'ClientSessionState.view(devices: $devices, selectedDevice: $selectedDevice)';
}


}

/// @nodoc
abstract mixin class $ClientSessionStateViewCopyWith<$Res> implements $ClientSessionStateCopyWith<$Res> {
  factory $ClientSessionStateViewCopyWith(ClientSessionStateView value, $Res Function(ClientSessionStateView) _then) = _$ClientSessionStateViewCopyWithImpl;
@useResult
$Res call({
 List<Device> devices, Device? selectedDevice
});




}
/// @nodoc
class _$ClientSessionStateViewCopyWithImpl<$Res>
    implements $ClientSessionStateViewCopyWith<$Res> {
  _$ClientSessionStateViewCopyWithImpl(this._self, this._then);

  final ClientSessionStateView _self;
  final $Res Function(ClientSessionStateView) _then;

/// Create a copy of ClientSessionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? devices = null,Object? selectedDevice = freezed,}) {
  return _then(ClientSessionStateView(
devices: null == devices ? _self._devices : devices // ignore: cast_nullable_to_non_nullable
as List<Device>,selectedDevice: freezed == selectedDevice ? _self.selectedDevice : selectedDevice // ignore: cast_nullable_to_non_nullable
as Device?,
  ));
}


}

/// @nodoc


class ClientSessionStateError implements ClientSessionState {
  const ClientSessionStateError({this.message});
  

 final  String? message;

/// Create a copy of ClientSessionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ClientSessionStateErrorCopyWith<ClientSessionStateError> get copyWith => _$ClientSessionStateErrorCopyWithImpl<ClientSessionStateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClientSessionStateError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'ClientSessionState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $ClientSessionStateErrorCopyWith<$Res> implements $ClientSessionStateCopyWith<$Res> {
  factory $ClientSessionStateErrorCopyWith(ClientSessionStateError value, $Res Function(ClientSessionStateError) _then) = _$ClientSessionStateErrorCopyWithImpl;
@useResult
$Res call({
 String? message
});




}
/// @nodoc
class _$ClientSessionStateErrorCopyWithImpl<$Res>
    implements $ClientSessionStateErrorCopyWith<$Res> {
  _$ClientSessionStateErrorCopyWithImpl(this._self, this._then);

  final ClientSessionStateError _self;
  final $Res Function(ClientSessionStateError) _then;

/// Create a copy of ClientSessionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = freezed,}) {
  return _then(ClientSessionStateError(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class ClientSessionStateConnected implements ClientSessionState {
  const ClientSessionStateConnected();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ClientSessionStateConnected);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ClientSessionState.connected()';
}


}




// dart format on
