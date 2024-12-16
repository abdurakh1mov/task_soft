part of 'home_bloc.dart';

@freezed
abstract class HomeEvent with _$HomeEvent {
  const factory HomeEvent.addAudio({
    required AudioModel model,
  }) = _AddAudio;
  const factory HomeEvent.getAudios() = _GetAudios;
}
