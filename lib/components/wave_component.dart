import 'dart:async';

import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:flutter/material.dart';
import 'package:task_soft/helper/helper.dart';
import 'package:task_soft/style/color_set.dart';

class WaveComponent extends StatefulWidget {
  const WaveComponent({
    super.key,
    required this.index,
    required this.width,
    required this.createdAt,
    required this.duration,
    required this.path,
  });
  final int index;
  final double width;
  final String createdAt;
  final int duration;
  final String path;
  @override
  State<WaveComponent> createState() => _WaveComponentState();
}

class _WaveComponentState extends State<WaveComponent> {
  late PlayerController playerController;
  late StreamSubscription<PlayerState> playerStateSubscription;
  bool isPlaying = false;
  int currentDuration = 0;
  @override
  void initState() {
    super.initState();
    playerController = PlayerController();
    playerController.preparePlayer(
      path: widget.path,
      shouldExtractWaveform: true,
    );
    playerStateSubscription =
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
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 12, right: 8),
      padding: EdgeInsets.only(
        left: 8,
        right: 9.31,
        // top: 8,
        bottom: 8,
      ),
      decoration: BoxDecoration(
        color: ColorSet.playerBackgroundColor,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      width: widget.width,
      height: 82,
      child: Column(
        children: [
          SizedBox(
            height: 8,
          ),
          Row(
            children: [
              Container(
                height: 44,
                width: 44,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: ColorSet.activeWaveColor,
                ),
                child: GestureDetector(
                  onTap: () {
                    _playAndPause();
                  },
                  child: Icon(
                    isPlaying ? Icons.stop_rounded : Icons.play_arrow_rounded,
                    color: Colors.white,
                    size: 24,
                  ),
                ),
              ),
              SizedBox(
                width: 6,
              ),
              Expanded(
                child: AudioFileWaveforms(
                  animationDuration: Duration(milliseconds: 10),
                  waveformType: WaveformType.fitWidth,
                  playerWaveStyle: PlayerWaveStyle(
                      waveThickness: 2,
                      spacing: 3,
                      showSeekLine: false,
                      fixedWaveColor: ColorSet.inActiveWaveColor,
                      seekLineColor: Colors.black,
                      liveWaveColor: ColorSet.activeWaveColor),
                  playerController: playerController,
                  size: Size(0, 36),
                ),
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                Helper().formatDuration(currentDuration),
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 4,
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Text(
              widget.createdAt,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: ColorSet.deleteIconColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
