import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kuncie_musicplayer/modules/music/models/music.model.dart';
import 'package:kuncie_musicplayer/modules/music/provider/music_player.provider.dart';
import 'package:provider/provider.dart';

class MusicItemWidget extends StatelessWidget {
  final Result music;
  final Function()? onTap;
  const MusicItemWidget({ 
    Key? key, 
    required this.music,
    required this.onTap
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10.0),
            child: FadeInImage.assetNetwork(
              placeholder: 'assets/images/loading.gif',
              image: "${music.artworkUrl100}",
              height: 100,
              width: 100,
              fit: BoxFit.cover,
              imageErrorBuilder: (context, object, stacktrace) {
                return Image.asset(
                  'assets/images/image-not-available.jpeg',
                  height: 100,
                  width: 100,
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
                  '${music.trackName}',
                  style: const TextStyle(
                    fontSize: 15.0,
                    color: Colors.white,
                    fontWeight: FontWeight.w700
                  ),
                ),
                Text(
                  '${music.artistName}',
                  style: const TextStyle(
                    fontSize: 12.0,
                    color: Colors.white
                  ),
                ),
                Text(
                  '${music.collectionName}',
                  style: const TextStyle(
                    fontSize: 12.0,
                    color: Colors.white
                  ),
                ),
              ],
            ),
          ),
          Consumer<MusicPlayerProvider>(
            builder: (context, mpValue, child) {
              if (mpValue.music == null) return Container();

              if (mpValue.music!.trackId == music.trackId) {
                if (mpValue.buffer) {
                  return const CupertinoActivityIndicator(color: Colors.white);
                }
                return Image.asset(
                  'assets/images/equalizer-2.gif',
                  height: 50,
                  width: 50,
                );
              }

              return Container();
            },
          )
        ],
      ),
    );
  }
}