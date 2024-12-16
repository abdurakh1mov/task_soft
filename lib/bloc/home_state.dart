part of 'home_bloc.dart';

@immutable
@freezed
class HomeState with _$HomeState {
  const HomeState._();

  const factory HomeState({
    @Default(null) List<AudioModel>? audios,
    @Default(null) List<PlayerController>? playerControllers,
  }) = _HomeState;
}
