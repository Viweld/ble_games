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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( HomeEventOnInitializationRequested value)?  onInitializationRequested,TResult Function( HomeEventOnStartSeverSessionTapped value)?  onStartSeverSessionTapped,TResult Function( HomeEventOnStartClientSessionTapped value)?  onStartClientSessionTapped,TResult Function( HomeEventOnTransportConnected value)?  onTransportConnected,required TResult orElse(),}){
final _that = this;
switch (_that) {
case HomeEventOnInitializationRequested() when onInitializationRequested != null:
return onInitializationRequested(_that);case HomeEventOnStartSeverSessionTapped() when onStartSeverSessionTapped != null:
return onStartSeverSessionTapped(_that);case HomeEventOnStartClientSessionTapped() when onStartClientSessionTapped != null:
return onStartClientSessionTapped(_that);case HomeEventOnTransportConnected() when onTransportConnected != null:
return onTransportConnected(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( HomeEventOnInitializationRequested value)  onInitializationRequested,required TResult Function( HomeEventOnStartSeverSessionTapped value)  onStartSeverSessionTapped,required TResult Function( HomeEventOnStartClientSessionTapped value)  onStartClientSessionTapped,required TResult Function( HomeEventOnTransportConnected value)  onTransportConnected,}){
final _that = this;
switch (_that) {
case HomeEventOnInitializationRequested():
return onInitializationRequested(_that);case HomeEventOnStartSeverSessionTapped():
return onStartSeverSessionTapped(_that);case HomeEventOnStartClientSessionTapped():
return onStartClientSessionTapped(_that);case HomeEventOnTransportConnected():
return onTransportConnected(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( HomeEventOnInitializationRequested value)?  onInitializationRequested,TResult? Function( HomeEventOnStartSeverSessionTapped value)?  onStartSeverSessionTapped,TResult? Function( HomeEventOnStartClientSessionTapped value)?  onStartClientSessionTapped,TResult? Function( HomeEventOnTransportConnected value)?  onTransportConnected,}){
final _that = this;
switch (_that) {
case HomeEventOnInitializationRequested() when onInitializationRequested != null:
return onInitializationRequested(_that);case HomeEventOnStartSeverSessionTapped() when onStartSeverSessionTapped != null:
return onStartSeverSessionTapped(_that);case HomeEventOnStartClientSessionTapped() when onStartClientSessionTapped != null:
return onStartClientSessionTapped(_that);case HomeEventOnTransportConnected() when onTransportConnected != null:
return onTransportConnected(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  onInitializationRequested,TResult Function()?  onStartSeverSessionTapped,TResult Function()?  onStartClientSessionTapped,TResult Function()?  onTransportConnected,required TResult orElse(),}) {final _that = this;
switch (_that) {
case HomeEventOnInitializationRequested() when onInitializationRequested != null:
return onInitializationRequested();case HomeEventOnStartSeverSessionTapped() when onStartSeverSessionTapped != null:
return onStartSeverSessionTapped();case HomeEventOnStartClientSessionTapped() when onStartClientSessionTapped != null:
return onStartClientSessionTapped();case HomeEventOnTransportConnected() when onTransportConnected != null:
return onTransportConnected();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  onInitializationRequested,required TResult Function()  onStartSeverSessionTapped,required TResult Function()  onStartClientSessionTapped,required TResult Function()  onTransportConnected,}) {final _that = this;
switch (_that) {
case HomeEventOnInitializationRequested():
return onInitializationRequested();case HomeEventOnStartSeverSessionTapped():
return onStartSeverSessionTapped();case HomeEventOnStartClientSessionTapped():
return onStartClientSessionTapped();case HomeEventOnTransportConnected():
return onTransportConnected();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  onInitializationRequested,TResult? Function()?  onStartSeverSessionTapped,TResult? Function()?  onStartClientSessionTapped,TResult? Function()?  onTransportConnected,}) {final _that = this;
switch (_that) {
case HomeEventOnInitializationRequested() when onInitializationRequested != null:
return onInitializationRequested();case HomeEventOnStartSeverSessionTapped() when onStartSeverSessionTapped != null:
return onStartSeverSessionTapped();case HomeEventOnStartClientSessionTapped() when onStartClientSessionTapped != null:
return onStartClientSessionTapped();case HomeEventOnTransportConnected() when onTransportConnected != null:
return onTransportConnected();case _:
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


class HomeEventOnStartSeverSessionTapped implements HomeEvent {
  const HomeEventOnStartSeverSessionTapped();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeEventOnStartSeverSessionTapped);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent.onStartSeverSessionTapped()';
}


}




/// @nodoc


class HomeEventOnStartClientSessionTapped implements HomeEvent {
  const HomeEventOnStartClientSessionTapped();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeEventOnStartClientSessionTapped);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent.onStartClientSessionTapped()';
}


}




/// @nodoc


class HomeEventOnTransportConnected implements HomeEvent {
  const HomeEventOnTransportConnected();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeEventOnTransportConnected);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeEvent.onTransportConnected()';
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( HomeStateInitializationPending value)?  initializationPending,TResult Function( HomeStateInitializationError value)?  initializationError,TResult Function( HomeStateView value)?  view,TResult Function( HomeStateStartAsServer value)?  startAsServer,TResult Function( HomeStateStartAsClient value)?  startAsClient,TResult Function( HomeStateNickNameRequired value)?  nickNameRequired,TResult Function( HomeStateConnected value)?  connected,required TResult orElse(),}){
final _that = this;
switch (_that) {
case HomeStateInitializationPending() when initializationPending != null:
return initializationPending(_that);case HomeStateInitializationError() when initializationError != null:
return initializationError(_that);case HomeStateView() when view != null:
return view(_that);case HomeStateStartAsServer() when startAsServer != null:
return startAsServer(_that);case HomeStateStartAsClient() when startAsClient != null:
return startAsClient(_that);case HomeStateNickNameRequired() when nickNameRequired != null:
return nickNameRequired(_that);case HomeStateConnected() when connected != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( HomeStateInitializationPending value)  initializationPending,required TResult Function( HomeStateInitializationError value)  initializationError,required TResult Function( HomeStateView value)  view,required TResult Function( HomeStateStartAsServer value)  startAsServer,required TResult Function( HomeStateStartAsClient value)  startAsClient,required TResult Function( HomeStateNickNameRequired value)  nickNameRequired,required TResult Function( HomeStateConnected value)  connected,}){
final _that = this;
switch (_that) {
case HomeStateInitializationPending():
return initializationPending(_that);case HomeStateInitializationError():
return initializationError(_that);case HomeStateView():
return view(_that);case HomeStateStartAsServer():
return startAsServer(_that);case HomeStateStartAsClient():
return startAsClient(_that);case HomeStateNickNameRequired():
return nickNameRequired(_that);case HomeStateConnected():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( HomeStateInitializationPending value)?  initializationPending,TResult? Function( HomeStateInitializationError value)?  initializationError,TResult? Function( HomeStateView value)?  view,TResult? Function( HomeStateStartAsServer value)?  startAsServer,TResult? Function( HomeStateStartAsClient value)?  startAsClient,TResult? Function( HomeStateNickNameRequired value)?  nickNameRequired,TResult? Function( HomeStateConnected value)?  connected,}){
final _that = this;
switch (_that) {
case HomeStateInitializationPending() when initializationPending != null:
return initializationPending(_that);case HomeStateInitializationError() when initializationError != null:
return initializationError(_that);case HomeStateView() when view != null:
return view(_that);case HomeStateStartAsServer() when startAsServer != null:
return startAsServer(_that);case HomeStateStartAsClient() when startAsClient != null:
return startAsClient(_that);case HomeStateNickNameRequired() when nickNameRequired != null:
return nickNameRequired(_that);case HomeStateConnected() when connected != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initializationPending,TResult Function( String message)?  initializationError,TResult Function()?  view,TResult Function()?  startAsServer,TResult Function()?  startAsClient,TResult Function( StartAs role)?  nickNameRequired,TResult Function()?  connected,required TResult orElse(),}) {final _that = this;
switch (_that) {
case HomeStateInitializationPending() when initializationPending != null:
return initializationPending();case HomeStateInitializationError() when initializationError != null:
return initializationError(_that.message);case HomeStateView() when view != null:
return view();case HomeStateStartAsServer() when startAsServer != null:
return startAsServer();case HomeStateStartAsClient() when startAsClient != null:
return startAsClient();case HomeStateNickNameRequired() when nickNameRequired != null:
return nickNameRequired(_that.role);case HomeStateConnected() when connected != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initializationPending,required TResult Function( String message)  initializationError,required TResult Function()  view,required TResult Function()  startAsServer,required TResult Function()  startAsClient,required TResult Function( StartAs role)  nickNameRequired,required TResult Function()  connected,}) {final _that = this;
switch (_that) {
case HomeStateInitializationPending():
return initializationPending();case HomeStateInitializationError():
return initializationError(_that.message);case HomeStateView():
return view();case HomeStateStartAsServer():
return startAsServer();case HomeStateStartAsClient():
return startAsClient();case HomeStateNickNameRequired():
return nickNameRequired(_that.role);case HomeStateConnected():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initializationPending,TResult? Function( String message)?  initializationError,TResult? Function()?  view,TResult? Function()?  startAsServer,TResult? Function()?  startAsClient,TResult? Function( StartAs role)?  nickNameRequired,TResult? Function()?  connected,}) {final _that = this;
switch (_that) {
case HomeStateInitializationPending() when initializationPending != null:
return initializationPending();case HomeStateInitializationError() when initializationError != null:
return initializationError(_that.message);case HomeStateView() when view != null:
return view();case HomeStateStartAsServer() when startAsServer != null:
return startAsServer();case HomeStateStartAsClient() when startAsClient != null:
return startAsClient();case HomeStateNickNameRequired() when nickNameRequired != null:
return nickNameRequired(_that.role);case HomeStateConnected() when connected != null:
return connected();case _:
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


class HomeStateStartAsServer implements HomeState {
  const HomeStateStartAsServer();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeStateStartAsServer);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeState.startAsServer()';
}


}




/// @nodoc


class HomeStateStartAsClient implements HomeState {
  const HomeStateStartAsClient();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeStateStartAsClient);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeState.startAsClient()';
}


}




/// @nodoc


class HomeStateNickNameRequired implements HomeState {
  const HomeStateNickNameRequired({required this.role});
  

 final  StartAs role;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HomeStateNickNameRequiredCopyWith<HomeStateNickNameRequired> get copyWith => _$HomeStateNickNameRequiredCopyWithImpl<HomeStateNickNameRequired>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeStateNickNameRequired&&(identical(other.role, role) || other.role == role));
}


@override
int get hashCode => Object.hash(runtimeType,role);

@override
String toString() {
  return 'HomeState.nickNameRequired(role: $role)';
}


}

/// @nodoc
abstract mixin class $HomeStateNickNameRequiredCopyWith<$Res> implements $HomeStateCopyWith<$Res> {
  factory $HomeStateNickNameRequiredCopyWith(HomeStateNickNameRequired value, $Res Function(HomeStateNickNameRequired) _then) = _$HomeStateNickNameRequiredCopyWithImpl;
@useResult
$Res call({
 StartAs role
});




}
/// @nodoc
class _$HomeStateNickNameRequiredCopyWithImpl<$Res>
    implements $HomeStateNickNameRequiredCopyWith<$Res> {
  _$HomeStateNickNameRequiredCopyWithImpl(this._self, this._then);

  final HomeStateNickNameRequired _self;
  final $Res Function(HomeStateNickNameRequired) _then;

/// Create a copy of HomeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? role = null,}) {
  return _then(HomeStateNickNameRequired(
role: null == role ? _self.role : role // ignore: cast_nullable_to_non_nullable
as StartAs,
  ));
}


}

/// @nodoc


class HomeStateConnected implements HomeState {
  const HomeStateConnected();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HomeStateConnected);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'HomeState.connected()';
}


}




// dart format on
