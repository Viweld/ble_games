// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'searching_devices_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SearchingDevicesEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchingDevicesEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SearchingDevicesEvent()';
}


}

/// @nodoc
class $SearchingDevicesEventCopyWith<$Res>  {
$SearchingDevicesEventCopyWith(SearchingDevicesEvent _, $Res Function(SearchingDevicesEvent) __);
}


/// Adds pattern-matching-related methods to [SearchingDevicesEvent].
extension SearchingDevicesEventPatterns on SearchingDevicesEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SearchingDevicesEventOnViewStateChanged value)?  onViewStateChanged,TResult Function( SearchingDevicesEventOnSearchingRequested value)?  onSearchingRequested,TResult Function( SearchingDevicesEventOnConnectToDevice value)?  onConnectToDevice,TResult Function( SearchingDevicesEventOnRefreshRequested value)?  onRefreshRequested,TResult Function( SearchingDevicesEventOnDeviceSelected value)?  onDeviceSelected,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SearchingDevicesEventOnViewStateChanged() when onViewStateChanged != null:
return onViewStateChanged(_that);case SearchingDevicesEventOnSearchingRequested() when onSearchingRequested != null:
return onSearchingRequested(_that);case SearchingDevicesEventOnConnectToDevice() when onConnectToDevice != null:
return onConnectToDevice(_that);case SearchingDevicesEventOnRefreshRequested() when onRefreshRequested != null:
return onRefreshRequested(_that);case SearchingDevicesEventOnDeviceSelected() when onDeviceSelected != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SearchingDevicesEventOnViewStateChanged value)  onViewStateChanged,required TResult Function( SearchingDevicesEventOnSearchingRequested value)  onSearchingRequested,required TResult Function( SearchingDevicesEventOnConnectToDevice value)  onConnectToDevice,required TResult Function( SearchingDevicesEventOnRefreshRequested value)  onRefreshRequested,required TResult Function( SearchingDevicesEventOnDeviceSelected value)  onDeviceSelected,}){
final _that = this;
switch (_that) {
case SearchingDevicesEventOnViewStateChanged():
return onViewStateChanged(_that);case SearchingDevicesEventOnSearchingRequested():
return onSearchingRequested(_that);case SearchingDevicesEventOnConnectToDevice():
return onConnectToDevice(_that);case SearchingDevicesEventOnRefreshRequested():
return onRefreshRequested(_that);case SearchingDevicesEventOnDeviceSelected():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SearchingDevicesEventOnViewStateChanged value)?  onViewStateChanged,TResult? Function( SearchingDevicesEventOnSearchingRequested value)?  onSearchingRequested,TResult? Function( SearchingDevicesEventOnConnectToDevice value)?  onConnectToDevice,TResult? Function( SearchingDevicesEventOnRefreshRequested value)?  onRefreshRequested,TResult? Function( SearchingDevicesEventOnDeviceSelected value)?  onDeviceSelected,}){
final _that = this;
switch (_that) {
case SearchingDevicesEventOnViewStateChanged() when onViewStateChanged != null:
return onViewStateChanged(_that);case SearchingDevicesEventOnSearchingRequested() when onSearchingRequested != null:
return onSearchingRequested(_that);case SearchingDevicesEventOnConnectToDevice() when onConnectToDevice != null:
return onConnectToDevice(_that);case SearchingDevicesEventOnRefreshRequested() when onRefreshRequested != null:
return onRefreshRequested(_that);case SearchingDevicesEventOnDeviceSelected() when onDeviceSelected != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  onViewStateChanged,TResult Function()?  onSearchingRequested,TResult Function()?  onConnectToDevice,TResult Function()?  onRefreshRequested,TResult Function( Device device)?  onDeviceSelected,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SearchingDevicesEventOnViewStateChanged() when onViewStateChanged != null:
return onViewStateChanged();case SearchingDevicesEventOnSearchingRequested() when onSearchingRequested != null:
return onSearchingRequested();case SearchingDevicesEventOnConnectToDevice() when onConnectToDevice != null:
return onConnectToDevice();case SearchingDevicesEventOnRefreshRequested() when onRefreshRequested != null:
return onRefreshRequested();case SearchingDevicesEventOnDeviceSelected() when onDeviceSelected != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  onViewStateChanged,required TResult Function()  onSearchingRequested,required TResult Function()  onConnectToDevice,required TResult Function()  onRefreshRequested,required TResult Function( Device device)  onDeviceSelected,}) {final _that = this;
switch (_that) {
case SearchingDevicesEventOnViewStateChanged():
return onViewStateChanged();case SearchingDevicesEventOnSearchingRequested():
return onSearchingRequested();case SearchingDevicesEventOnConnectToDevice():
return onConnectToDevice();case SearchingDevicesEventOnRefreshRequested():
return onRefreshRequested();case SearchingDevicesEventOnDeviceSelected():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  onViewStateChanged,TResult? Function()?  onSearchingRequested,TResult? Function()?  onConnectToDevice,TResult? Function()?  onRefreshRequested,TResult? Function( Device device)?  onDeviceSelected,}) {final _that = this;
switch (_that) {
case SearchingDevicesEventOnViewStateChanged() when onViewStateChanged != null:
return onViewStateChanged();case SearchingDevicesEventOnSearchingRequested() when onSearchingRequested != null:
return onSearchingRequested();case SearchingDevicesEventOnConnectToDevice() when onConnectToDevice != null:
return onConnectToDevice();case SearchingDevicesEventOnRefreshRequested() when onRefreshRequested != null:
return onRefreshRequested();case SearchingDevicesEventOnDeviceSelected() when onDeviceSelected != null:
return onDeviceSelected(_that.device);case _:
  return null;

}
}

}

/// @nodoc


class SearchingDevicesEventOnViewStateChanged implements SearchingDevicesEvent {
  const SearchingDevicesEventOnViewStateChanged();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchingDevicesEventOnViewStateChanged);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SearchingDevicesEvent.onViewStateChanged()';
}


}




/// @nodoc


class SearchingDevicesEventOnSearchingRequested implements SearchingDevicesEvent {
  const SearchingDevicesEventOnSearchingRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchingDevicesEventOnSearchingRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SearchingDevicesEvent.onSearchingRequested()';
}


}




/// @nodoc


class SearchingDevicesEventOnConnectToDevice implements SearchingDevicesEvent {
  const SearchingDevicesEventOnConnectToDevice();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchingDevicesEventOnConnectToDevice);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SearchingDevicesEvent.onConnectToDevice()';
}


}




/// @nodoc


class SearchingDevicesEventOnRefreshRequested implements SearchingDevicesEvent {
  const SearchingDevicesEventOnRefreshRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchingDevicesEventOnRefreshRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SearchingDevicesEvent.onRefreshRequested()';
}


}




/// @nodoc


class SearchingDevicesEventOnDeviceSelected implements SearchingDevicesEvent {
  const SearchingDevicesEventOnDeviceSelected({required this.device});
  

 final  Device device;

/// Create a copy of SearchingDevicesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchingDevicesEventOnDeviceSelectedCopyWith<SearchingDevicesEventOnDeviceSelected> get copyWith => _$SearchingDevicesEventOnDeviceSelectedCopyWithImpl<SearchingDevicesEventOnDeviceSelected>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchingDevicesEventOnDeviceSelected&&(identical(other.device, device) || other.device == device));
}


@override
int get hashCode => Object.hash(runtimeType,device);

@override
String toString() {
  return 'SearchingDevicesEvent.onDeviceSelected(device: $device)';
}


}

/// @nodoc
abstract mixin class $SearchingDevicesEventOnDeviceSelectedCopyWith<$Res> implements $SearchingDevicesEventCopyWith<$Res> {
  factory $SearchingDevicesEventOnDeviceSelectedCopyWith(SearchingDevicesEventOnDeviceSelected value, $Res Function(SearchingDevicesEventOnDeviceSelected) _then) = _$SearchingDevicesEventOnDeviceSelectedCopyWithImpl;
@useResult
$Res call({
 Device device
});




}
/// @nodoc
class _$SearchingDevicesEventOnDeviceSelectedCopyWithImpl<$Res>
    implements $SearchingDevicesEventOnDeviceSelectedCopyWith<$Res> {
  _$SearchingDevicesEventOnDeviceSelectedCopyWithImpl(this._self, this._then);

  final SearchingDevicesEventOnDeviceSelected _self;
  final $Res Function(SearchingDevicesEventOnDeviceSelected) _then;

/// Create a copy of SearchingDevicesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? device = null,}) {
  return _then(SearchingDevicesEventOnDeviceSelected(
device: null == device ? _self.device : device // ignore: cast_nullable_to_non_nullable
as Device,
  ));
}


}

/// @nodoc
mixin _$SearchingDevicesState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchingDevicesState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SearchingDevicesState()';
}


}

/// @nodoc
class $SearchingDevicesStateCopyWith<$Res>  {
$SearchingDevicesStateCopyWith(SearchingDevicesState _, $Res Function(SearchingDevicesState) __);
}


/// Adds pattern-matching-related methods to [SearchingDevicesState].
extension SearchingDevicesStatePatterns on SearchingDevicesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SearchingDevicesStateView value)?  view,TResult Function( SearchingDevicesStateConnected value)?  connected,TResult Function( SearchingDevicesStateError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SearchingDevicesStateView() when view != null:
return view(_that);case SearchingDevicesStateConnected() when connected != null:
return connected(_that);case SearchingDevicesStateError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SearchingDevicesStateView value)  view,required TResult Function( SearchingDevicesStateConnected value)  connected,required TResult Function( SearchingDevicesStateError value)  error,}){
final _that = this;
switch (_that) {
case SearchingDevicesStateView():
return view(_that);case SearchingDevicesStateConnected():
return connected(_that);case SearchingDevicesStateError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SearchingDevicesStateView value)?  view,TResult? Function( SearchingDevicesStateConnected value)?  connected,TResult? Function( SearchingDevicesStateError value)?  error,}){
final _that = this;
switch (_that) {
case SearchingDevicesStateView() when view != null:
return view(_that);case SearchingDevicesStateConnected() when connected != null:
return connected(_that);case SearchingDevicesStateError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( List<Device> devices,  Device? selectedDevice)?  view,TResult Function()?  connected,TResult Function( String? message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SearchingDevicesStateView() when view != null:
return view(_that.devices,_that.selectedDevice);case SearchingDevicesStateConnected() when connected != null:
return connected();case SearchingDevicesStateError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( List<Device> devices,  Device? selectedDevice)  view,required TResult Function()  connected,required TResult Function( String? message)  error,}) {final _that = this;
switch (_that) {
case SearchingDevicesStateView():
return view(_that.devices,_that.selectedDevice);case SearchingDevicesStateConnected():
return connected();case SearchingDevicesStateError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( List<Device> devices,  Device? selectedDevice)?  view,TResult? Function()?  connected,TResult? Function( String? message)?  error,}) {final _that = this;
switch (_that) {
case SearchingDevicesStateView() when view != null:
return view(_that.devices,_that.selectedDevice);case SearchingDevicesStateConnected() when connected != null:
return connected();case SearchingDevicesStateError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class SearchingDevicesStateView implements SearchingDevicesState {
  const SearchingDevicesStateView({required final  List<Device> devices, this.selectedDevice}): _devices = devices;
  

 final  List<Device> _devices;
 List<Device> get devices {
  if (_devices is EqualUnmodifiableListView) return _devices;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_devices);
}

 final  Device? selectedDevice;

/// Create a copy of SearchingDevicesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchingDevicesStateViewCopyWith<SearchingDevicesStateView> get copyWith => _$SearchingDevicesStateViewCopyWithImpl<SearchingDevicesStateView>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchingDevicesStateView&&const DeepCollectionEquality().equals(other._devices, _devices)&&(identical(other.selectedDevice, selectedDevice) || other.selectedDevice == selectedDevice));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_devices),selectedDevice);

@override
String toString() {
  return 'SearchingDevicesState.view(devices: $devices, selectedDevice: $selectedDevice)';
}


}

/// @nodoc
abstract mixin class $SearchingDevicesStateViewCopyWith<$Res> implements $SearchingDevicesStateCopyWith<$Res> {
  factory $SearchingDevicesStateViewCopyWith(SearchingDevicesStateView value, $Res Function(SearchingDevicesStateView) _then) = _$SearchingDevicesStateViewCopyWithImpl;
@useResult
$Res call({
 List<Device> devices, Device? selectedDevice
});




}
/// @nodoc
class _$SearchingDevicesStateViewCopyWithImpl<$Res>
    implements $SearchingDevicesStateViewCopyWith<$Res> {
  _$SearchingDevicesStateViewCopyWithImpl(this._self, this._then);

  final SearchingDevicesStateView _self;
  final $Res Function(SearchingDevicesStateView) _then;

/// Create a copy of SearchingDevicesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? devices = null,Object? selectedDevice = freezed,}) {
  return _then(SearchingDevicesStateView(
devices: null == devices ? _self._devices : devices // ignore: cast_nullable_to_non_nullable
as List<Device>,selectedDevice: freezed == selectedDevice ? _self.selectedDevice : selectedDevice // ignore: cast_nullable_to_non_nullable
as Device?,
  ));
}


}

/// @nodoc


class SearchingDevicesStateConnected implements SearchingDevicesState {
  const SearchingDevicesStateConnected();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchingDevicesStateConnected);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SearchingDevicesState.connected()';
}


}




/// @nodoc


class SearchingDevicesStateError implements SearchingDevicesState {
  const SearchingDevicesStateError({this.message});
  

 final  String? message;

/// Create a copy of SearchingDevicesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SearchingDevicesStateErrorCopyWith<SearchingDevicesStateError> get copyWith => _$SearchingDevicesStateErrorCopyWithImpl<SearchingDevicesStateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SearchingDevicesStateError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'SearchingDevicesState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $SearchingDevicesStateErrorCopyWith<$Res> implements $SearchingDevicesStateCopyWith<$Res> {
  factory $SearchingDevicesStateErrorCopyWith(SearchingDevicesStateError value, $Res Function(SearchingDevicesStateError) _then) = _$SearchingDevicesStateErrorCopyWithImpl;
@useResult
$Res call({
 String? message
});




}
/// @nodoc
class _$SearchingDevicesStateErrorCopyWithImpl<$Res>
    implements $SearchingDevicesStateErrorCopyWith<$Res> {
  _$SearchingDevicesStateErrorCopyWithImpl(this._self, this._then);

  final SearchingDevicesStateError _self;
  final $Res Function(SearchingDevicesStateError) _then;

/// Create a copy of SearchingDevicesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = freezed,}) {
  return _then(SearchingDevicesStateError(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
