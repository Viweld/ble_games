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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ServerSessionEventOnInitializationRequested value)?  onInitializationRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ServerSessionEventOnInitializationRequested() when onInitializationRequested != null:
return onInitializationRequested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ServerSessionEventOnInitializationRequested value)  onInitializationRequested,}){
final _that = this;
switch (_that) {
case ServerSessionEventOnInitializationRequested():
return onInitializationRequested(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ServerSessionEventOnInitializationRequested value)?  onInitializationRequested,}){
final _that = this;
switch (_that) {
case ServerSessionEventOnInitializationRequested() when onInitializationRequested != null:
return onInitializationRequested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  onInitializationRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ServerSessionEventOnInitializationRequested() when onInitializationRequested != null:
return onInitializationRequested();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  onInitializationRequested,}) {final _that = this;
switch (_that) {
case ServerSessionEventOnInitializationRequested():
return onInitializationRequested();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  onInitializationRequested,}) {final _that = this;
switch (_that) {
case ServerSessionEventOnInitializationRequested() when onInitializationRequested != null:
return onInitializationRequested();case _:
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ServerSessionStateView value)?  view,TResult Function( ServerSessionStateConnected value)?  connected,TResult Function( ServerSessionStateError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ServerSessionStateView() when view != null:
return view(_that);case ServerSessionStateConnected() when connected != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ServerSessionStateView value)  view,required TResult Function( ServerSessionStateConnected value)  connected,required TResult Function( ServerSessionStateError value)  error,}){
final _that = this;
switch (_that) {
case ServerSessionStateView():
return view(_that);case ServerSessionStateConnected():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ServerSessionStateView value)?  view,TResult? Function( ServerSessionStateConnected value)?  connected,TResult? Function( ServerSessionStateError value)?  error,}){
final _that = this;
switch (_that) {
case ServerSessionStateView() when view != null:
return view(_that);case ServerSessionStateConnected() when connected != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  view,TResult Function()?  connected,TResult Function( String? message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ServerSessionStateView() when view != null:
return view();case ServerSessionStateConnected() when connected != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  view,required TResult Function()  connected,required TResult Function( String? message)  error,}) {final _that = this;
switch (_that) {
case ServerSessionStateView():
return view();case ServerSessionStateConnected():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  view,TResult? Function()?  connected,TResult? Function( String? message)?  error,}) {final _that = this;
switch (_that) {
case ServerSessionStateView() when view != null:
return view();case ServerSessionStateConnected() when connected != null:
return connected();case ServerSessionStateError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class ServerSessionStateView implements ServerSessionState {
  const ServerSessionStateView();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServerSessionStateView);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ServerSessionState.view()';
}


}




/// @nodoc


class ServerSessionStateConnected implements ServerSessionState {
  const ServerSessionStateConnected();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServerSessionStateConnected);
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
