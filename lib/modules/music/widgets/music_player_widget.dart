import 'package:flutter/material.dart';
import 'package:kuncie_musicplayer/modules/music/provider/music.provider.dart';
import 'package:kuncie_musicplayer/modules/music/provider/music_player.provider.dart';
import 'package:provider/provider.dart';

class MusicPlayerWidget extends StatelessWidget {
  const MusicPlayerWidget({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final _musicPlayerProvider = Provider.of<MusicPlayerProvider>(context);
    final _musicProvider = Provider.of<MusicProvider>(context);

    return Container(
      height: 100,
      padding: const EdgeInsets.all(10.0),
      decoration: const BoxDecoration(
        color: Color(0xff0F0B2A)
      ),
      child: Column(
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: FadeInImage.assetNetwork(
                  placeholder: 'assets/images/loading.gif',
                  image: "${_musicPlayerProvider.music?.artworkUrl100}",
                  height: 50,
                  width: 50,
                  fit: BoxFit.cover,
                  imageErrorBuilder: (context, object, stacktrace) {
                    return Image.asset(
                      'assets/images/image-not-available.jpeg',
                      height: 50,
                      width: 50,
                      fit: BoxFit.cover,
                    );
                  },
                ),
              ),
              const SizedBox(width: 10.0,),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${_musicPlayerProvider.music?.trackName}",
                      style: const TextStyle(
                        fontSize: 15.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w700
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      "${_musicPlayerProvider.music?.artistName}",
                      style: const TextStyle(
                        fontSize: 12.0,
                        color: Colors.white
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      '${_musicPlayerProvider.music?.collectionName}',
                      style: const TextStyle(
                        fontSize: 12.0,
                        color: Colors.white
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              IconButton(
                onPressed: () {
                  _musicPlayerProvider.playPrevSong(_musicProvider.musics);
                }, 
                icon: const Icon(Icons.skip_previous_rounded),
                color: Colors.white,
              ),
              IconButton(
                onPressed: () {
                  if (_musicPlayerProvider.playerModel.isPlaying!) {
                    _musicPlayerProvider.pauseAudio();
                  } else {
                    _musicPlayerProvider.playAudio();
                  }
                }, 
                icon: _musicPlayerProvider.playerModel.isPlaying! 
                  ? const Icon(Icons.pause_rounded)
                  : const Icon(Icons.play_arrow_rounded),
                color: Colors.white,
              ),
              IconButton(
                onPressed: () {
                  _musicPlayerProvider.playNextSong(_musicProvider.musics);
                }, 
                icon: const Icon(Icons.skip_next_rounded),
                color: Colors.white,
              ),
            ],
          ),
          const SizedBox(height: 10.0,),
          Stack(
            children: [
              Container(
                height: 5,
                decoration: BoxDecoration(
                  color: const Color(0xff4D3768),
                  borderRadius: BorderRadius.circular(10.0)
                )
              ),
              Container(
                height: 5,
                width: _musicPlayerProvider.playerModel.currentPosition! / _musicPlayerProvider.playerModel.duration! * MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: const Color(0xffBB7FFF),
                  borderRadius: BorderRadius.circular(10.0)
                )
              ),
            ],
          )
        ],
      ),
    );
  }
}