import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kuncie_musicplayer/modules/music/provider/music.provider.dart';
import 'package:kuncie_musicplayer/modules/music/provider/music_player.provider.dart';
import 'package:kuncie_musicplayer/modules/music/widgets/music_item.widget.dart';
import 'package:kuncie_musicplayer/modules/music/widgets/music_player_widget.dart';
import 'package:kuncie_musicplayer/modules/music/widgets/search_bar.widget.dart';
import 'package:provider/provider.dart';

class MusicScreen extends StatefulWidget {
  const MusicScreen({ Key? key }) : super(key: key);

  @override
  State<MusicScreen> createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {

  final _musicProvider = MusicProvider();
  final _musicPlayerProvider = MusicPlayerProvider();

  @override
  void initState() {
    super.initState();

    _musicProvider.getMusics();
  }

  @override
  void dispose() {
    super.dispose();
    _musicPlayerProvider.resetAudio();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MusicProvider>(create: (context) => _musicProvider,),
        ChangeNotifierProvider<MusicPlayerProvider>(create: (context) => _musicPlayerProvider,)
      ],
      child: Scaffold(
        backgroundColor: const Color(0xff25214F),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Welcome',
                style: TextStyle(
                  color: Color(0xff8A6EFF)
                ),
              ),
              Text(
                'John Doe!',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24.0
                ),
              ),
            ],
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: CircleAvatar(
                backgroundImage: AssetImage("assets/images/profile.png"),
              ),
            )
          ]
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0, top: 20.0),
              child: SearchBarWidget(
                onChanged: (value) {},
                onSubmitted: (value) {
                  _musicProvider.getMusics(search: value);
                  _musicPlayerProvider.resetAudio();
                },
              ),
            ),
            Expanded(
              child: Consumer<MusicProvider>(
                builder: (context, value, child) {
                  if (value.loading) return const Center(child: CupertinoActivityIndicator(color: Colors.white,));

                  if (value.musics.isNotEmpty) {
                    return ListView.separated(
                      physics: const BouncingScrollPhysics(
                        parent: AlwaysScrollableScrollPhysics()
                      ),
                      padding: const EdgeInsets.all(20.0),
                      itemCount: value.musics.length,
                      separatorBuilder: (context, index) => const SizedBox(height: 10.0), 
                      itemBuilder: (context, index) {
                        return MusicItemWidget(
                          music: value.musics[index], 
                          onTap: () {
                            _musicPlayerProvider.setMusic(value.musics[index]);
                          },
                        );
                      }, 
                    );
                  }

                  return const Center(
                    child: Text(
                      'Music is empty',
                      style: TextStyle(
                        color: Colors.white
                      ),
                    )
                  );
                },
              ),
            )
          ],
        ),
        bottomNavigationBar: Consumer<MusicPlayerProvider>(
          builder: (context, value, child) {
            if (value.music == null) return const SizedBox();

            return const MusicPlayerWidget();
          },
        ),
      ),
    );
  }
}