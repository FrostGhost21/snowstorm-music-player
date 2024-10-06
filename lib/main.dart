import 'package:get_it/get_it.dart';
import 'package:just_audio/just_audio.dart';
import 'package:flutter/material.dart';
import 'package:snowstorm_v2/class.dart';
import 'package:snowstorm_v2/db.dart';
import 'package:snowstorm_v2/pages/music.dart';
import 'package:snowstorm_v2/pages/web.dart';

final getIt = GetIt.instance;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppDatabase database = AppDatabase();
  AudioPlayer player = AudioPlayer();
  ConcatenatingAudioSource playlist = ConcatenatingAudioSource(children: []);
  //0 is the default page
  AppState appState = AppState(playlist, database, player, 0);

  getIt.registerSingleton<List<Song>>(await appState.database.getSongs());
  getIt.registerSingleton<AppState>(appState);
  await getIt<AppState>().initPlaylist();
  await getIt<AppState>().checkOSUAPIKey();

  runApp(const SnowstormStart());
}

class SnowstormStart extends StatefulWidget {
  const SnowstormStart({super.key});
  @override
  State<SnowstormStart> createState() => _SnowstormStartState();
}

class _SnowstormStartState extends State<SnowstormStart> {
  int _index = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            addFolder();
          },
          child: const Icon(Icons.folder),
        ),
        body: [body(), network()][getIt<AppState>().page],
        bottomNavigationBar: NavigationBar(
          destinations: const [
            NavigationDestination(
                icon: Icon(Icons.import_contacts), label: "web"),
            NavigationDestination(
                icon: Icon(Icons.import_contacts), label: "music")
          ],
          selectedIndex: getIt<AppState>().page,
          onDestinationSelected: (int index) {
            getIt<AppState>().page = index;
            setState(() {
              _index = index;
            });
          },
        ),
      ),
    ));
  }
}
