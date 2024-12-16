import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:task_soft/db/db_audio.dart';
import 'package:task_soft/model/audio_model.dart';

part 'home_state.dart';
part 'home_event.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const _HomeState()) {
    on<_AddAudio>(_addAudio);
    on<_GetAudios>(_getAudios);
  }

  Future<void> _addAudio(_AddAudio event, Emitter<HomeState> emit) async {
    List<AudioModel> durationList = List.from(state.audios ?? []);
    List<PlayerController> playerControllers =
        List.from(state.playerControllers ?? []);
    final controller = PlayerController();
    await controller.preparePlayer(path: event.model.path);
    controller.setFinishMode(finishMode: FinishMode.pause);
    durationList.add(event.model);
    await DbAudio().addAudio(event.model);
    playerControllers.add(controller);
    emit(state.copyWith(
        audios: durationList, playerControllers: playerControllers));
  }

  Future<void> _getAudios(_GetAudios event, Emitter<HomeState> emit) async {
    final audiosDb = DbAudio().loadAudios;
    List<PlayerController> playerControllers =
        List.from(state.playerControllers ?? []);
    for (var i = 0; i < audiosDb.length; i++) {
      final controller = PlayerController();
      await controller.preparePlayer(path: audiosDb[i].path);
      controller.setFinishMode(finishMode: FinishMode.pause);
      playerControllers.add(controller);
    }
    emit(
        state.copyWith(audios: audiosDb, playerControllers: playerControllers));
  }
}
