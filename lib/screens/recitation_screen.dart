import 'dart:async';

import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:task_soft/bloc/home_bloc.dart';
import 'package:task_soft/components/animated_button.dart';
import 'package:task_soft/components/custom_app_bar.dart';
import 'package:task_soft/components/custom_button.dart';
import 'package:task_soft/helper/helper.dart';
import 'package:task_soft/model/audio_model.dart';
import 'package:task_soft/style/color_set.dart';

class RecitationScreen extends StatefulWidget {
  const RecitationScreen({super.key});

  @override
  State<RecitationScreen> createState() => _RecitationScreenState();
}

class _RecitationScreenState extends State<RecitationScreen>
    with SingleTickerProviderStateMixin {
  String? recordedFilePath;
  final RecorderController recorderController = RecorderController();
  late PlayerController playerController;
  AnimationController? _controllerA;
  var squareScaleA = 0.95;
  Timer? _timer;
  bool isRecording = false;
  bool isPlaying = false;
  int currentDuration = 0;

  @override
  void initState() {
    super.initState();
    playerController = PlayerController();
    playerController.onPlayerStateChanged.listen((event) {
      if (event == PlayerState.initialized) {
        setState(() {
          currentDuration = playerController.maxDuration ~/ 1000;
        });
      }
      if (event == PlayerState.playing) {
        isPlaying = true;
      } else if (event == PlayerState.paused) {
        isPlaying = false;
      } else {
        playerController.seekTo(0);
        isPlaying = false;
      }
      setState(() {});
    });
    playerController.onCurrentDurationChanged.listen((event) {
      if (event != 0) {
        setState(() {
          final seconds = (event ~/ 1000);
          currentDuration = seconds;
        });
      }
    });
    _controllerA = AnimationController(
      vsync: this,
      lowerBound: 0.95,
      upperBound: 1.0,
      duration: const Duration(milliseconds: 80),
    );
    _controllerA!.addListener(() {
      setState(() {
        squareScaleA = _controllerA!.value;
      });
    });

    _controllerA!.forward(from: 0.0);
  }

  Future<void> _toggleRecording() async {
    if (isRecording) {
      recordedFilePath = await recorderController.stop(false);
      playerController.preparePlayer(
        path: recordedFilePath ?? "",
        shouldExtractWaveform: true,
      );
      setState(() {
        isRecording = false;
      });
      _timer?.cancel();
    } else {
      await recorderController.record();
      currentDuration = 0;
      _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
        setState(() {
          currentDuration++;
        });
      });
      isRecording = true;
      setState(() {});
    }
  }

  void _playAndPause() async {
    if (playerController.playerState == PlayerState.playing) {
      await playerController.pausePlayer();
    } else {
      await playerController.startPlayer();
    }
    playerController.setFinishMode(finishMode: FinishMode.pause);
  }

  @override
  void dispose() {
    playerController.dispose();
    recorderController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: ColorSet.mainBackgroundColor,
          appBar: CustomAppBar(
            title: "Fotiha surasini qiroat qilish",
            isBackAvailable: true,
          ),
          body: LayoutBuilder(builder: (context, constraints) {
            return Column(
              children: [
                SizedBox(
                  height: 8,
                ),
                Container(
                  color: ColorSet.mainBackgroundColor,
                  // width: constraints.maxWidth,
                  height: constraints.maxHeight * 0.7,
                  child: Image.asset(
                    fit: BoxFit.cover,
                    "assets/images/suratul_fatiha.png",
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 40,
                    right: 40,
                  ),
                  child: (recordedFilePath != null)
                      ? Column(
                          children: [
                            SizedBox(
                              height: 12,
                            ),
                            Container(
                              padding: EdgeInsets.only(
                                top: 4,
                                bottom: 4,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: AudioFileWaveforms(
                                      continuousWaveform: true,
                                      waveformType: WaveformType.fitWidth,
                                      playerWaveStyle: PlayerWaveStyle(
                                          waveThickness: 2,
                                          spacing: 3,
                                          showSeekLine: false,
                                          fixedWaveColor:
                                              ColorSet.inActiveWaveColor,
                                          seekLineColor: Colors.black,
                                          liveWaveColor:
                                              ColorSet.activeWaveColor),
                                      playerController: playerController,
                                      size: Size(0, 43),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 12,
                            ),
                            Text(
                              Helper().formatDuration(
                                currentDuration,
                              ),
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.black),
                            ),
                          ],
                        )
                      : SizedBox(),
                ),
                if (recordedFilePath == null)
                  Column(
                    children: [
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        Helper().formatDuration(
                          currentDuration,
                        ),
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.black),
                      ),
                    ],
                  ),
                SizedBox(
                  height: 12,
                ),
                if (recordedFilePath == null)
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: PlayButton(
                      pauseIcon: Icon(Icons.stop_rounded,
                          color: Colors.white, size: 40),
                      playIcon:
                          Icon(Icons.play_arrow, color: Colors.white, size: 40),
                      onPressed: () {
                        _toggleRecording();
                      },
                    ),
                  ),
                Expanded(child: SizedBox()),
                if (recordedFilePath != null)
                  Container(
                    padding: EdgeInsets.only(
                      left: 4,
                      right: 4,
                      top: 4,
                    ),
                    height: constraints.maxHeight * 0.14,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(33),
                        topRight: Radius.circular(33),
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            CustomButton(
                                iconColor: ColorSet.reciteButtonColor,
                                height: 64,
                                width: 64,
                                icon: isPlaying
                                    ? Icons.stop_rounded
                                    : Icons.play_arrow_rounded,
                                title: "",
                                onTap: () {
                                  _playAndPause();
                                }),
                            SizedBox(
                              width: 8,
                            ),
                            Expanded(
                              child: GestureDetector(
                                behavior: HitTestBehavior.translucent,
                                onTap: () {
                                  FocusScopeNode currentFocus =
                                      FocusScope.of(context);
                                  if (currentFocus.hasPrimaryFocus) {
                                    currentFocus.unfocus();
                                  }
                                  var model = AudioModel(
                                    duration: recorderController
                                        .recordedDuration.inSeconds,
                                    path: recordedFilePath!,
                                    createdAt: DateFormat('HH:mm, dd.MM.yy')
                                        .format(DateTime.now()),
                                  );
                                  context
                                      .read<HomeBloc>()
                                      .add(HomeEvent.addAudio(model: model));
                                  Navigator.pop(context);
                                },
                                child: Listener(
                                  behavior: HitTestBehavior.opaque,
                                  onPointerDown: (_) {
                                    _controllerA!.reverse();
                                  },
                                  onPointerUp: (_) {
                                    _controllerA!.forward(from: 1.0);
                                  },
                                  child: Transform.scale(
                                      scale: squareScaleA,
                                      child: Container(
                                        height: 64,
                                        // width: constraints.maxWidth * 0.,
                                        decoration: BoxDecoration(
                                          color: ColorSet.reciteButtonColor,
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(
                                              64,
                                            ),
                                          ),
                                        ),
                                        child: Center(
                                          child: Text(
                                            "Yuborish",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ),
                                      )),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            CustomButton(
                                iconColor: ColorSet.deleteIconColor,
                                height: 64,
                                width: 64,
                                icon: Icons.delete,
                                title: "",
                                onTap: () {
                                  setState(() {
                                    recordedFilePath = null;
                                    currentDuration = 0;
                                  });
                                }),
                          ],
                        ),
                      ],
                    ),
                  ),
              ],
            );
          }),
        );
      },
    );
  }
}
