import 'package:just_audio/just_audio.dart';
import 'package:snowstorm_v2/db.dart';

class AppState {
  ConcatenatingAudioSource playlist;
  AppDatabase database;
  AudioPlayer player;
  AppState(this.playlist, this.database, this.player);

  void updatePlaylist(List<int> songs) {}
}
