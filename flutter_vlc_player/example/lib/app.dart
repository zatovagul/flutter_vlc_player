import 'package:flutter/material.dart';
import 'package:flutter_vlc_player/flutter_vlc_player.dart';
import 'package:flutter_vlc_player_example/multiple_tab.dart';
import 'package:flutter_vlc_player_example/single_tab.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  static const _tabCount = 2;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: _tabCount,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Vlc Player Example'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Single'),
              Tab(text: 'Multiple'),
            ],
          ),
        ),
        body: PlayerView(),
        // body: TabBarView(
        //   physics: const NeverScrollableScrollPhysics(),
        //   children: [
        //     SingleTab(),
        //     MultipleTab(),
        //   ],
        // ),
      ),
    );
  }
}

class PlayerView extends StatefulWidget {
  const PlayerView({super.key});

  @override
  State<PlayerView> createState() => _PlayerViewState();
}

class _PlayerViewState extends State<PlayerView> {
  VlcPlayerController? controller;

  @override
  void initState() {
    super.initState();
    controller = VlcPlayerController.network(
      'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',

    );
  }

  @override
  Widget build(BuildContext context) {
    if (controller == null) return Text('qwe');
    return VlcPlayer(
      controller: controller!,
      aspectRatio: 1,
    );
  }
}
