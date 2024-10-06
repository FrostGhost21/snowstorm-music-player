import 'package:just_audio/just_audio.dart';
import 'package:snowstorm_v2/db.dart';

class AppState {
  ConcatenatingAudioSource playlist;
  AppDatabase database;
  AudioPlayer player;
  AppState(this.playlist, this.database, this.player);

  void playSong(int id) {
    player.seek(Duration.zero, index: id);
    if (!player.playing) {
      player.play();
    }
  }

  Future<void> initPlaylist() async {
    List<AudioSource> audioSources = [];
    for (Song song in await database.getSongs()) {
      audioSources.add(AudioSource.file(song.path));
    }
    playlist = ConcatenatingAudioSource(
        children: audioSources, useLazyPreparation: true);
    player.setAudioSource(preload: false, initialIndex: 0, playlist);
  }
}
