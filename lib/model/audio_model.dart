import 'package:hive/hive.dart';
part 'audio_model.g.dart';

@HiveType(typeId: 0)
class AudioModel {
  @HiveField(0)
  final int duration;

  @HiveField(1)
  final String path;

  @HiveField(2)
  final String createdAt;

  AudioModel({
    required this.duration,
    required this.path,
    required this.createdAt,
  });
}
