import 'dart:io';

import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
import 'package:task_soft/model/audio_model.dart';

class DbBase {
  static const _dbAudio = 'localDBAudio';
  static late final Box _dbBoxAudio;

  static Future<Box> ensureInitialized() async {
    try {
      final dir = await getApplicationDocumentsDirectory();
      Hive.init(dir.path);
      Directory('${dir.path}/dir')
          .create(recursive: true)
          .then((Directory directory) {
        Hive.init(directory.path);
      });

      await Hive.initFlutter();
      Hive.registerAdapter(AudioModelAdapter());
      _dbBoxAudio = await Hive.openBox(_dbAudio);
      return _dbBoxAudio;
    } catch (e) {
      print("Error initializing Hive: $e");
      rethrow;
    }
  }

  Box get dbBox => _dbBoxAudio;
}
