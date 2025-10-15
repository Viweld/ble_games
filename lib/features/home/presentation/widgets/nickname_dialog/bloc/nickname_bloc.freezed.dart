// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nickname_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NicknameEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NicknameEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NicknameEvent()';
}


}

/// @nodoc
class $NicknameEventCopyWith<$Res>  {
$NicknameEventCopyWith(NicknameEvent _, $Res Function(NicknameEvent) __);
}


/// Adds pattern-matching-related methods to [NicknameEvent].
extension NicknameEventPatterns on NicknameEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( NicknameEventOnNicknameChanged value)?  onNicknameChanged,TResult Function( NicknameEventOnSaveNickname value)?  onSaveNickname,required TResult orElse(),}){
final _that = this;
switch (_that) {
case NicknameEventOnNicknameChanged() when onNicknameChanged != null:
return onNicknameChanged(_that);case NicknameEventOnSaveNickname() when onSaveNickname != null:
return onSaveNickname(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( NicknameEventOnNicknameChanged value)  onNicknameChanged,required TResult Function( NicknameEventOnSaveNickname value)  onSaveNickname,}){
final _that = this;
switch (_that) {
case NicknameEventOnNicknameChanged():
return onNicknameChanged(_that);case NicknameEventOnSaveNickname():
return onSaveNickname(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( NicknameEventOnNicknameChanged value)?  onNicknameChanged,TResult? Function( NicknameEventOnSaveNickname value)?  onSaveNickname,}){
final _that = this;
switch (_that) {
case NicknameEventOnNicknameChanged() when onNicknameChanged != null:
return onNicknameChanged(_that);case NicknameEventOnSaveNickname() when onSaveNickname != null:
return onSaveNickname(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String nick)?  onNicknameChanged,TResult Function()?  onSaveNickname,required TResult orElse(),}) {final _that = this;
switch (_that) {
case NicknameEventOnNicknameChanged() when onNicknameChanged != null:
return onNicknameChanged(_that.nick);case NicknameEventOnSaveNickname() when onSaveNickname != null:
return onSaveNickname();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String nick)  onNicknameChanged,required TResult Function()  onSaveNickname,}) {final _that = this;
switch (_that) {
case NicknameEventOnNicknameChanged():
return onNicknameChanged(_that.nick);case NicknameEventOnSaveNickname():
return onSaveNickname();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String nick)?  onNicknameChanged,TResult? Function()?  onSaveNickname,}) {final _that = this;
switch (_that) {
case NicknameEventOnNicknameChanged() when onNicknameChanged != null:
return onNicknameChanged(_that.nick);case NicknameEventOnSaveNickname() when onSaveNickname != null:
return onSaveNickname();case _:
  return null;

}
}

}

/// @nodoc


class NicknameEventOnNicknameChanged implements NicknameEvent {
  const NicknameEventOnNicknameChanged({required this.nick});
  

 final  String nick;

/// Create a copy of NicknameEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NicknameEventOnNicknameChangedCopyWith<NicknameEventOnNicknameChanged> get copyWith => _$NicknameEventOnNicknameChangedCopyWithImpl<NicknameEventOnNicknameChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NicknameEventOnNicknameChanged&&(identical(other.nick, nick) || other.nick == nick));
}


@override
int get hashCode => Object.hash(runtimeType,nick);

@override
String toString() {
  return 'NicknameEvent.onNicknameChanged(nick: $nick)';
}


}

/// @nodoc
abstract mixin class $NicknameEventOnNicknameChangedCopyWith<$Res> implements $NicknameEventCopyWith<$Res> {
  factory $NicknameEventOnNicknameChangedCopyWith(NicknameEventOnNicknameChanged value, $Res Function(NicknameEventOnNicknameChanged) _then) = _$NicknameEventOnNicknameChangedCopyWithImpl;
@useResult
$Res call({
 String nick
});




}
/// @nodoc
class _$NicknameEventOnNicknameChangedCopyWithImpl<$Res>
    implements $NicknameEventOnNicknameChangedCopyWith<$Res> {
  _$NicknameEventOnNicknameChangedCopyWithImpl(this._self, this._then);

  final NicknameEventOnNicknameChanged _self;
  final $Res Function(NicknameEventOnNicknameChanged) _then;

/// Create a copy of NicknameEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? nick = null,}) {
  return _then(NicknameEventOnNicknameChanged(
nick: null == nick ? _self.nick : nick // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class NicknameEventOnSaveNickname implements NicknameEvent {
  const NicknameEventOnSaveNickname();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NicknameEventOnSaveNickname);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NicknameEvent.onSaveNickname()';
}


}




/// @nodoc
mixin _$NicknameState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NicknameState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NicknameState()';
}


}

/// @nodoc
class $NicknameStateCopyWith<$Res>  {
$NicknameStateCopyWith(NicknameState _, $Res Function(NicknameState) __);
}


/// Adds pattern-matching-related methods to [NicknameState].
extension NicknameStatePatterns on NicknameState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( NicknameStateView value)?  view,TResult Function( NicknameStateNicknameSaved value)?  nicknameSaved,TResult Function( NicknameStateError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case NicknameStateView() when view != null:
return view(_that);case NicknameStateNicknameSaved() when nicknameSaved != null:
return nicknameSaved(_that);case NicknameStateError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( NicknameStateView value)  view,required TResult Function( NicknameStateNicknameSaved value)  nicknameSaved,required TResult Function( NicknameStateError value)  error,}){
final _that = this;
switch (_that) {
case NicknameStateView():
return view(_that);case NicknameStateNicknameSaved():
return nicknameSaved(_that);case NicknameStateError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( NicknameStateView value)?  view,TResult? Function( NicknameStateNicknameSaved value)?  nicknameSaved,TResult? Function( NicknameStateError value)?  error,}){
final _that = this;
switch (_that) {
case NicknameStateView() when view != null:
return view(_that);case NicknameStateNicknameSaved() when nicknameSaved != null:
return nicknameSaved(_that);case NicknameStateError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String nickName,  NickNameValidationState? nickNameValidationState,  bool isSaveButtonEnabled)?  view,TResult Function()?  nicknameSaved,TResult Function( String message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case NicknameStateView() when view != null:
return view(_that.nickName,_that.nickNameValidationState,_that.isSaveButtonEnabled);case NicknameStateNicknameSaved() when nicknameSaved != null:
return nicknameSaved();case NicknameStateError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String nickName,  NickNameValidationState? nickNameValidationState,  bool isSaveButtonEnabled)  view,required TResult Function()  nicknameSaved,required TResult Function( String message)  error,}) {final _that = this;
switch (_that) {
case NicknameStateView():
return view(_that.nickName,_that.nickNameValidationState,_that.isSaveButtonEnabled);case NicknameStateNicknameSaved():
return nicknameSaved();case NicknameStateError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String nickName,  NickNameValidationState? nickNameValidationState,  bool isSaveButtonEnabled)?  view,TResult? Function()?  nicknameSaved,TResult? Function( String message)?  error,}) {final _that = this;
switch (_that) {
case NicknameStateView() when view != null:
return view(_that.nickName,_that.nickNameValidationState,_that.isSaveButtonEnabled);case NicknameStateNicknameSaved() when nicknameSaved != null:
return nicknameSaved();case NicknameStateError() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class NicknameStateView implements NicknameState {
  const NicknameStateView({this.nickName = '', this.nickNameValidationState, this.isSaveButtonEnabled = false});
  

@JsonKey() final  String nickName;
 final  NickNameValidationState? nickNameValidationState;
@JsonKey() final  bool isSaveButtonEnabled;

/// Create a copy of NicknameState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NicknameStateViewCopyWith<NicknameStateView> get copyWith => _$NicknameStateViewCopyWithImpl<NicknameStateView>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NicknameStateView&&(identical(other.nickName, nickName) || other.nickName == nickName)&&(identical(other.nickNameValidationState, nickNameValidationState) || other.nickNameValidationState == nickNameValidationState)&&(identical(other.isSaveButtonEnabled, isSaveButtonEnabled) || other.isSaveButtonEnabled == isSaveButtonEnabled));
}


@override
int get hashCode => Object.hash(runtimeType,nickName,nickNameValidationState,isSaveButtonEnabled);

@override
String toString() {
  return 'NicknameState.view(nickName: $nickName, nickNameValidationState: $nickNameValidationState, isSaveButtonEnabled: $isSaveButtonEnabled)';
}


}

/// @nodoc
abstract mixin class $NicknameStateViewCopyWith<$Res> implements $NicknameStateCopyWith<$Res> {
  factory $NicknameStateViewCopyWith(NicknameStateView value, $Res Function(NicknameStateView) _then) = _$NicknameStateViewCopyWithImpl;
@useResult
$Res call({
 String nickName, NickNameValidationState? nickNameValidationState, bool isSaveButtonEnabled
});




}
/// @nodoc
class _$NicknameStateViewCopyWithImpl<$Res>
    implements $NicknameStateViewCopyWith<$Res> {
  _$NicknameStateViewCopyWithImpl(this._self, this._then);

  final NicknameStateView _self;
  final $Res Function(NicknameStateView) _then;

/// Create a copy of NicknameState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? nickName = null,Object? nickNameValidationState = freezed,Object? isSaveButtonEnabled = null,}) {
  return _then(NicknameStateView(
nickName: null == nickName ? _self.nickName : nickName // ignore: cast_nullable_to_non_nullable
as String,nickNameValidationState: freezed == nickNameValidationState ? _self.nickNameValidationState : nickNameValidationState // ignore: cast_nullable_to_non_nullable
as NickNameValidationState?,isSaveButtonEnabled: null == isSaveButtonEnabled ? _self.isSaveButtonEnabled : isSaveButtonEnabled // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class NicknameStateNicknameSaved implements NicknameState {
  const NicknameStateNicknameSaved();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NicknameStateNicknameSaved);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NicknameState.nicknameSaved()';
}


}




/// @nodoc


class NicknameStateError implements NicknameState {
  const NicknameStateError({required this.message});
  

 final  String message;

/// Create a copy of NicknameState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$NicknameStateErrorCopyWith<NicknameStateError> get copyWith => _$NicknameStateErrorCopyWithImpl<NicknameStateError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NicknameStateError&&(identical(other.message, message) || other.message == message));
}


@override
int get hashCode => Object.hash(runtimeType,message);

@override
String toString() {
  return 'NicknameState.error(message: $message)';
}


}

/// @nodoc
abstract mixin class $NicknameStateErrorCopyWith<$Res> implements $NicknameStateCopyWith<$Res> {
  factory $NicknameStateErrorCopyWith(NicknameStateError value, $Res Function(NicknameStateError) _then) = _$NicknameStateErrorCopyWithImpl;
@useResult
$Res call({
 String message
});




}
/// @nodoc
class _$NicknameStateErrorCopyWithImpl<$Res>
    implements $NicknameStateErrorCopyWith<$Res> {
  _$NicknameStateErrorCopyWithImpl(this._self, this._then);

  final NicknameStateError _self;
  final $Res Function(NicknameStateError) _then;

/// Create a copy of NicknameState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = null,}) {
  return _then(NicknameStateError(
message: null == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
