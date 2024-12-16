import 'package:hive/hive.dart';
import 'package:task_soft/model/audio_model.dart';

class DbAudio {
  final _dbName = "localDBAudio";
  late final Box _box;

  DbAudio() {
    _box = Hive.box(_dbName);
  }

  List<AudioModel> get loadAudios {
    final data = _box.values.cast<AudioModel>().toList();
    return data.map((item) => item).toList();
  }

  Future<void> addAudio(AudioModel audio) async {
    await _box.add(audio);
  }

  Future<void> deleteHiveBox() async {
    try {
      if (Hive.isBoxOpen(_dbName)) {
        await _box.clear();
        print('All records deleted.');
      } else {
        print('Box not found or already deleted.');
      }
    } catch (e) {
      print('Error deleting box: $e');
    }
  }
}
