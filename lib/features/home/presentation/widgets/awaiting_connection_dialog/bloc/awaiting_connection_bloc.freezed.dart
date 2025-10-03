// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'awaiting_connection_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AwaitingConnectionEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AwaitingConnectionEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AwaitingConnectionEvent()';
}


}

/// @nodoc
class $AwaitingConnectionEventCopyWith<$Res>  {
$AwaitingConnectionEventCopyWith(AwaitingConnectionEvent _, $Res Function(AwaitingConnectionEvent) __);
}


/// Adds pattern-matching-related methods to [AwaitingConnectionEvent].
extension AwaitingConnectionEventPatterns on AwaitingConnectionEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AwaitingConnectionEventOnAdvertisingRequested value)?  onAdvertisingRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AwaitingConnectionEventOnAdvertisingRequested() when onAdvertisingRequested != null:
return onAdvertisingRequested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AwaitingConnectionEventOnAdvertisingRequested value)  onAdvertisingRequested,}){
final _that = this;
switch (_that) {
case AwaitingConnectionEventOnAdvertisingRequested():
return onAdvertisingRequested(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AwaitingConnectionEventOnAdvertisingRequested value)?  onAdvertisingRequested,}){
final _that = this;
switch (_that) {
case AwaitingConnectionEventOnAdvertisingRequested() when onAdvertisingRequested != null:
return onAdvertisingRequested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  onAdvertisingRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AwaitingConnectionEventOnAdvertisingRequested() when onAdvertisingRequested != null:
return onAdvertisingRequested();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  onAdvertisingRequested,}) {final _that = this;
switch (_that) {
case AwaitingConnectionEventOnAdvertisingRequested():
return onAdvertisingRequested();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  onAdvertisingRequested,}) {final _that = this;
switch (_that) {
case AwaitingConnectionEventOnAdvertisingRequested() when onAdvertisingRequested != null:
return onAdvertisingRequested();case _:
  return null;

}
}

}

/// @nodoc


class AwaitingConnectionEventOnAdvertisingRequested implements AwaitingConnectionEvent {
  const AwaitingConnectionEventOnAdvertisingRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AwaitingConnectionEventOnAdvertisingRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AwaitingConnectionEvent.onAdvertisingRequested()';
}


}




/// @nodoc
mixin _$AwaitingConnectionState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AwaitingConnectionState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AwaitingConnectionState()';
}


}

/// @nodoc
class $AwaitingConnectionStateCopyWith<$Res>  {
$AwaitingConnectionStateCopyWith(AwaitingConnectionState _, $Res Function(AwaitingConnectionState) __);
}


/// Adds pattern-matching-related methods to [AwaitingConnectionState].
extension AwaitingConnectionStatePatterns on AwaitingConnectionState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AwaitingConnectionStateView value)?  view,TResult Function( AwaitingConnectionStateConnected value)?  connected,TResult Function( AwaitingConnectionStateError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AwaitingConnectionStateView() when view != null:
return view(_that);case AwaitingConnectionStateConnected() when connected != null:
return connected(_that);case AwaitingConnectionStateError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AwaitingConnectionStateView value)  view,required TResult Function( AwaitingConnectionStateConnected value)  connected,required TResult Function( AwaitingConnectionStateError value)  error,}){
final _that = this;
switch (_that) {
case AwaitingConnectionStateView():
return view(_that);case AwaitingConnectionStateConnected():
return connected(_that);case AwaitingConnectionStateError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AwaitingConnectionStateView value)?  view,TResult? Function( AwaitingConnectionStateConnected value)?  connected,TResult? Function( AwaitingConnectionStateError value)?  error,}){
final _that = this;
switch (_that) {
case AwaitingConnectionStateView() when view != null:
return view(_that);case AwaitingConnectionStateConnected() when connected != null:
return connected(_that);case AwaitingConnectionStateError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  view,TResult Function()?  connected,TResult Function( String? message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AwaitingConnectionStateView() when view != null:
return view();case AwaitingConnectionStateConnected() when connected != null:
return connected();case AwaitingConnectionStateError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  view,required TResult Function()  connected,required TResult Function( String? message)  error,}) {final _that = this;
switch (_that) {
case AwaitingConnectionStateView():
return view();case AwaitingConnectionStateConnected():
return connected();case AwaitingConnectionStateError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  view,TResult? Function()?  connected,TResult? Function( String? message)?  error,}) {final _that = this;
switch (_that) {
case AwaitingConnectionStateView() when view != null:
return view();case AwaitingConnectionStateConnected() when connected != null:
return connected();case AwaitingConnectionStateError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class AwaitingConnectionStateView implements AwaitingConnectionState {
  const AwaitingConnectionStateView();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AwaitingConnectionStateView);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AwaitingConnectionState.view()';
}


}




/// @nodoc


class AwaitingConnectionStateConnected implements AwaitingConnectionState {
  const AwaitingConnectionStateConnected();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AwaitingConnectionStateConnected);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AwaitingConnectionState.connected()';
}


}




/// @nodoc


class AwaitingConnectionStateError implements AwaitingConnectionState {
  const AwaitingConnectionStateError({this.message});
  

 final  String? message;

/// Create a copy of AwaitingConnectionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AwaitingConnectionStateErrorCopyWith<AwaitingConnectionStateError> get copyWith => _$AwaitingConnectionStateErrorCopyWithImpl<AwaitingConnectionStateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AwaitingConnectionStateError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'AwaitingConnectionState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $AwaitingConnectionStateErrorCopyWith<$Res> implements $AwaitingConnectionStateCopyWith<$Res> {
  factory $AwaitingConnectionStateErrorCopyWith(AwaitingConnectionStateError value, $Res Function(AwaitingConnectionStateError) _then) = _$AwaitingConnectionStateErrorCopyWithImpl;
@useResult
$Res call({
 String? message
});




}
/// @nodoc
class _$AwaitingConnectionStateErrorCopyWithImpl<$Res>
    implements $AwaitingConnectionStateErrorCopyWith<$Res> {
  _$AwaitingConnectionStateErrorCopyWithImpl(this._self, this._then);

  final AwaitingConnectionStateError _self;
  final $Res Function(AwaitingConnectionStateError) _then;

/// Create a copy of AwaitingConnectionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = freezed,}) {
  return _then(AwaitingConnectionStateError(
message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
