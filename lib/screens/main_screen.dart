import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_soft/bloc/home_bloc.dart';
import 'package:task_soft/components/custom_app_bar.dart';
import 'package:task_soft/components/wave_component.dart';
import 'package:task_soft/screens/recitation_screen.dart';
import 'package:task_soft/style/color_set.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final videoUrl = "https://youtu.be/PLHddf-1MHY";
  late YoutubePlayerController _playerController;
  @override
  void initState() {
    final videoID = YoutubePlayer.convertUrlToId(videoUrl);
    _playerController = YoutubePlayerController(
      initialVideoId: videoID!,
      flags: YoutubePlayerFlags(autoPlay: false),
    );
    context.read<HomeBloc>().add(HomeEvent.getAudios());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        return Scaffold(
            backgroundColor: ColorSet.mainBackgroundColor,
            appBar: CustomAppBar(title: "Fotiha surasi"),
            body: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
              return Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(8),
                    width: constraints.maxWidth,
                    height: constraints.maxHeight * 0.83,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          16,
                        ),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: constraints.maxWidth * 0.85,
                            padding: EdgeInsets.all(8),
                            margin: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10),
                              ),
                              color: ColorSet.playerBackgroundColor,
                            ),
                            child: Column(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10),
                                  ),
                                  child: YoutubePlayer(
                                    controller: _playerController,
                                    showVideoProgressIndicator: true,
                                    onReady: () =>
                                        debugPrint("Player is ready"),
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  "Fotiha surasida yo‘l qo‘yilishi mumkin bo‘lgan xatolar ",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w400,
                                  ),
                                )
                              ],
                            ),
                          ),
                          for (int i = 0; i < (state.audios?.length ?? 0); i++)
                            Align(
                              alignment: Alignment.centerRight,
                              child: WaveComponent(
                                index: i,
                                width: constraints.maxWidth * 0.85,
                                createdAt: state.audios?[i].createdAt ?? "",
                                duration: state.audios?[i].duration ?? 0,
                                path: state.audios?[i].path ?? "",
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(
                            33,
                          ),
                          topRight: Radius.circular(
                            33,
                          ),
                        ),
                      ),
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 20, right: 12),
                            margin: EdgeInsets.all(4),
                            height: 64,
                            decoration: BoxDecoration(
                              color: ColorSet.recitationContainerColor,
                              borderRadius: BorderRadius.all(
                                Radius.circular(
                                  64,
                                ),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Qiroatni tekshirish...",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500,
                                    color: ColorSet.checkRecitationColor,
                                  ),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      elevation: 0,
                                      backgroundColor:
                                          ColorSet.reciteButtonColor,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(
                                          Radius.circular(
                                            48,
                                          ),
                                        ),
                                      )),
                                  onPressed: () => {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) {
                                        return BlocProvider.value(
                                          value: (context).read<HomeBloc>(),
                                          child: RecitationScreen(),
                                        );
                                      }),
                                    )
                                  },
                                  child: SizedBox(
                                    height: 46,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "Qiroat qilish",
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white),
                                        ),
                                        SizedBox(
                                          width: 12,
                                        ),
                                        Icon(
                                          Icons.arrow_forward_ios_rounded,
                                          size: 16,
                                          color: Colors.white,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                // ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }));
      },
    );
  }
}
