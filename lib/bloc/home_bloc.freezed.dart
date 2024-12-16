// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeState {
  List<AudioModel>? get audios => throw _privateConstructorUsedError;
  List<PlayerController>? get playerControllers =>
      throw _privateConstructorUsedError;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call(
      {List<AudioModel>? audios, List<PlayerController>? playerControllers});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? audios = freezed,
    Object? playerControllers = freezed,
  }) {
    return _then(_value.copyWith(
      audios: freezed == audios
          ? _value.audios
          : audios // ignore: cast_nullable_to_non_nullable
              as List<AudioModel>?,
      playerControllers: freezed == playerControllers
          ? _value.playerControllers
          : playerControllers // ignore: cast_nullable_to_non_nullable
              as List<PlayerController>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HomeStateImplCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$$HomeStateImplCopyWith(
          _$HomeStateImpl value, $Res Function(_$HomeStateImpl) then) =
      __$$HomeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<AudioModel>? audios, List<PlayerController>? playerControllers});
}

/// @nodoc
class __$$HomeStateImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$HomeStateImpl>
    implements _$$HomeStateImplCopyWith<$Res> {
  __$$HomeStateImplCopyWithImpl(
      _$HomeStateImpl _value, $Res Function(_$HomeStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? audios = freezed,
    Object? playerControllers = freezed,
  }) {
    return _then(_$HomeStateImpl(
      audios: freezed == audios
          ? _value._audios
          : audios // ignore: cast_nullable_to_non_nullable
              as List<AudioModel>?,
      playerControllers: freezed == playerControllers
          ? _value._playerControllers
          : playerControllers // ignore: cast_nullable_to_non_nullable
              as List<PlayerController>?,
    ));
  }
}

/// @nodoc

class _$HomeStateImpl extends _HomeState {
  const _$HomeStateImpl(
      {final List<AudioModel>? audios = null,
      final List<PlayerController>? playerControllers = null})
      : _audios = audios,
        _playerControllers = playerControllers,
        super._();

  final List<AudioModel>? _audios;
  @override
  @JsonKey()
  List<AudioModel>? get audios {
    final value = _audios;
    if (value == null) return null;
    if (_audios is EqualUnmodifiableListView) return _audios;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<PlayerController>? _playerControllers;
  @override
  @JsonKey()
  List<PlayerController>? get playerControllers {
    final value = _playerControllers;
    if (value == null) return null;
    if (_playerControllers is EqualUnmodifiableListView)
      return _playerControllers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'HomeState(audios: $audios, playerControllers: $playerControllers)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HomeStateImpl &&
            const DeepCollectionEquality().equals(other._audios, _audios) &&
            const DeepCollectionEquality()
                .equals(other._playerControllers, _playerControllers));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_audios),
      const DeepCollectionEquality().hash(_playerControllers));

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      __$$HomeStateImplCopyWithImpl<_$HomeStateImpl>(this, _$identity);
}

abstract class _HomeState extends HomeState {
  const factory _HomeState(
      {final List<AudioModel>? audios,
      final List<PlayerController>? playerControllers}) = _$HomeStateImpl;
  const _HomeState._() : super._();

  @override
  List<AudioModel>? get audios;
  @override
  List<PlayerController>? get playerControllers;

  /// Create a copy of HomeState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HomeStateImplCopyWith<_$HomeStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$HomeEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AudioModel model) addAudio,
    required TResult Function() getAudios,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AudioModel model)? addAudio,
    TResult? Function()? getAudios,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AudioModel model)? addAudio,
    TResult Function()? getAudios,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddAudio value) addAudio,
    required TResult Function(_GetAudios value) getAudios,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddAudio value)? addAudio,
    TResult? Function(_GetAudios value)? getAudios,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddAudio value)? addAudio,
    TResult Function(_GetAudios value)? getAudios,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeEventCopyWith<$Res> {
  factory $HomeEventCopyWith(HomeEvent value, $Res Function(HomeEvent) then) =
      _$HomeEventCopyWithImpl<$Res, HomeEvent>;
}

/// @nodoc
class _$HomeEventCopyWithImpl<$Res, $Val extends HomeEvent>
    implements $HomeEventCopyWith<$Res> {
  _$HomeEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$AddAudioImplCopyWith<$Res> {
  factory _$$AddAudioImplCopyWith(
          _$AddAudioImpl value, $Res Function(_$AddAudioImpl) then) =
      __$$AddAudioImplCopyWithImpl<$Res>;
  @useResult
  $Res call({AudioModel model});
}

/// @nodoc
class __$$AddAudioImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$AddAudioImpl>
    implements _$$AddAudioImplCopyWith<$Res> {
  __$$AddAudioImplCopyWithImpl(
      _$AddAudioImpl _value, $Res Function(_$AddAudioImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? model = null,
  }) {
    return _then(_$AddAudioImpl(
      model: null == model
          ? _value.model
          : model // ignore: cast_nullable_to_non_nullable
              as AudioModel,
    ));
  }
}

/// @nodoc

class _$AddAudioImpl implements _AddAudio {
  const _$AddAudioImpl({required this.model});

  @override
  final AudioModel model;

  @override
  String toString() {
    return 'HomeEvent.addAudio(model: $model)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddAudioImpl &&
            (identical(other.model, model) || other.model == model));
  }

  @override
  int get hashCode => Object.hash(runtimeType, model);

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AddAudioImplCopyWith<_$AddAudioImpl> get copyWith =>
      __$$AddAudioImplCopyWithImpl<_$AddAudioImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AudioModel model) addAudio,
    required TResult Function() getAudios,
  }) {
    return addAudio(model);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AudioModel model)? addAudio,
    TResult? Function()? getAudios,
  }) {
    return addAudio?.call(model);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AudioModel model)? addAudio,
    TResult Function()? getAudios,
    required TResult orElse(),
  }) {
    if (addAudio != null) {
      return addAudio(model);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddAudio value) addAudio,
    required TResult Function(_GetAudios value) getAudios,
  }) {
    return addAudio(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddAudio value)? addAudio,
    TResult? Function(_GetAudios value)? getAudios,
  }) {
    return addAudio?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddAudio value)? addAudio,
    TResult Function(_GetAudios value)? getAudios,
    required TResult orElse(),
  }) {
    if (addAudio != null) {
      return addAudio(this);
    }
    return orElse();
  }
}

abstract class _AddAudio implements HomeEvent {
  const factory _AddAudio({required final AudioModel model}) = _$AddAudioImpl;

  AudioModel get model;

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AddAudioImplCopyWith<_$AddAudioImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetAudiosImplCopyWith<$Res> {
  factory _$$GetAudiosImplCopyWith(
          _$GetAudiosImpl value, $Res Function(_$GetAudiosImpl) then) =
      __$$GetAudiosImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetAudiosImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$GetAudiosImpl>
    implements _$$GetAudiosImplCopyWith<$Res> {
  __$$GetAudiosImplCopyWithImpl(
      _$GetAudiosImpl _value, $Res Function(_$GetAudiosImpl) _then)
      : super(_value, _then);

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc

class _$GetAudiosImpl implements _GetAudios {
  const _$GetAudiosImpl();

  @override
  String toString() {
    return 'HomeEvent.getAudios()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetAudiosImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(AudioModel model) addAudio,
    required TResult Function() getAudios,
  }) {
    return getAudios();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(AudioModel model)? addAudio,
    TResult? Function()? getAudios,
  }) {
    return getAudios?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(AudioModel model)? addAudio,
    TResult Function()? getAudios,
    required TResult orElse(),
  }) {
    if (getAudios != null) {
      return getAudios();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddAudio value) addAudio,
    required TResult Function(_GetAudios value) getAudios,
  }) {
    return getAudios(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddAudio value)? addAudio,
    TResult? Function(_GetAudios value)? getAudios,
  }) {
    return getAudios?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddAudio value)? addAudio,
    TResult Function(_GetAudios value)? getAudios,
    required TResult orElse(),
  }) {
    if (getAudios != null) {
      return getAudios(this);
    }
    return orElse();
  }
}

abstract class _GetAudios implements HomeEvent {
  const factory _GetAudios() = _$GetAudiosImpl;
}
