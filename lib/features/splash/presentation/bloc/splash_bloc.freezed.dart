// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'splash_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SplashEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SplashEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SplashEvent()';
}


}

/// @nodoc
class $SplashEventCopyWith<$Res>  {
$SplashEventCopyWith(SplashEvent _, $Res Function(SplashEvent) __);
}


/// Adds pattern-matching-related methods to [SplashEvent].
extension SplashEventPatterns on SplashEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SplashEventOnInitializationRequested value)?  onInitializationRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SplashEventOnInitializationRequested() when onInitializationRequested != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SplashEventOnInitializationRequested value)  onInitializationRequested,}){
final _that = this;
switch (_that) {
case SplashEventOnInitializationRequested():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SplashEventOnInitializationRequested value)?  onInitializationRequested,}){
final _that = this;
switch (_that) {
case SplashEventOnInitializationRequested() when onInitializationRequested != null:
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
case SplashEventOnInitializationRequested() when onInitializationRequested != null:
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
case SplashEventOnInitializationRequested():
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
case SplashEventOnInitializationRequested() when onInitializationRequested != null:
return onInitializationRequested();case _:
  return null;

}
}

}

/// @nodoc


class SplashEventOnInitializationRequested implements SplashEvent {
  const SplashEventOnInitializationRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SplashEventOnInitializationRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SplashEvent.onInitializationRequested()';
}


}




/// @nodoc
mixin _$SplashState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SplashState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SplashState()';
}


}

/// @nodoc
class $SplashStateCopyWith<$Res>  {
$SplashStateCopyWith(SplashState _, $Res Function(SplashState) __);
}


/// Adds pattern-matching-related methods to [SplashState].
extension SplashStatePatterns on SplashState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( SplashStateInitializationPending value)?  initializationPending,TResult Function( SplashStateInitializationError value)?  initializationError,TResult Function( SplashStateView value)?  view,required TResult orElse(),}){
final _that = this;
switch (_that) {
case SplashStateInitializationPending() when initializationPending != null:
return initializationPending(_that);case SplashStateInitializationError() when initializationError != null:
return initializationError(_that);case SplashStateView() when view != null:
return view(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( SplashStateInitializationPending value)  initializationPending,required TResult Function( SplashStateInitializationError value)  initializationError,required TResult Function( SplashStateView value)  view,}){
final _that = this;
switch (_that) {
case SplashStateInitializationPending():
return initializationPending(_that);case SplashStateInitializationError():
return initializationError(_that);case SplashStateView():
return view(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( SplashStateInitializationPending value)?  initializationPending,TResult? Function( SplashStateInitializationError value)?  initializationError,TResult? Function( SplashStateView value)?  view,}){
final _that = this;
switch (_that) {
case SplashStateInitializationPending() when initializationPending != null:
return initializationPending(_that);case SplashStateInitializationError() when initializationError != null:
return initializationError(_that);case SplashStateView() when view != null:
return view(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initializationPending,TResult Function( String message)?  initializationError,TResult Function()?  view,required TResult orElse(),}) {final _that = this;
switch (_that) {
case SplashStateInitializationPending() when initializationPending != null:
return initializationPending();case SplashStateInitializationError() when initializationError != null:
return initializationError(_that.message);case SplashStateView() when view != null:
return view();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initializationPending,required TResult Function( String message)  initializationError,required TResult Function()  view,}) {final _that = this;
switch (_that) {
case SplashStateInitializationPending():
return initializationPending();case SplashStateInitializationError():
return initializationError(_that.message);case SplashStateView():
return view();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initializationPending,TResult? Function( String message)?  initializationError,TResult? Function()?  view,}) {final _that = this;
switch (_that) {
case SplashStateInitializationPending() when initializationPending != null:
return initializationPending();case SplashStateInitializationError() when initializationError != null:
return initializationError(_that.message);case SplashStateView() when view != null:
return view();case _:
  return null;

}
}

}

/// @nodoc


class SplashStateInitializationPending implements SplashState {
  const SplashStateInitializationPending();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SplashStateInitializationPending);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SplashState.initializationPending()';
}


}




/// @nodoc


class SplashStateInitializationError implements SplashState {
  const SplashStateInitializationError(this.message);
  

 final  String message;

/// Create a copy of SplashState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SplashStateInitializationErrorCopyWith<SplashStateInitializationError> get copyWith => _$SplashStateInitializationErrorCopyWithImpl<SplashStateInitializationError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SplashStateInitializationError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'SplashState.initializationError(message: $message)';
}


}

/// @nodoc
abstract mixin class $SplashStateInitializationErrorCopyWith<$Res> implements $SplashStateCopyWith<$Res> {
  factory $SplashStateInitializationErrorCopyWith(SplashStateInitializationError value, $Res Function(SplashStateInitializationError) _then) = _$SplashStateInitializationErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$SplashStateInitializationErrorCopyWithImpl<$Res>
    implements $SplashStateInitializationErrorCopyWith<$Res> {
  _$SplashStateInitializationErrorCopyWithImpl(this._self, this._then);

  final SplashStateInitializationError _self;
  final $Res Function(SplashStateInitializationError) _then;

/// Create a copy of SplashState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(SplashStateInitializationError(
null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class SplashStateView implements SplashState {
  const SplashStateView();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SplashStateView);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'SplashState.view()';
}


}




// dart format on
