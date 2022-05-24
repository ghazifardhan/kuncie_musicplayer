import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kuncie_musicplayer/modules/music/models/music.model.dart';
import 'package:kuncie_musicplayer/modules/music/models/music_player.model.dart';

class MusicPlayerProvider extends ChangeNotifier {

  // flutter platform channel from native code
  static const platform = MethodChannel('com.ghazifadil.dev/mediaplayer');
  
  // variable to store audio status
  String _audioStatus = "";
  String get audioStatus => _audioStatus;

  // variable to store data of the song
  // if value is null, mean no audio to play
  Result? _music;
  Result? get music => _music;

  // variable to store buffer of the audio when user firstly tap
  bool _buffer = false;
  bool get buffer => _buffer;

  // variable to store music player model
  MusicPlayerModel _playerModel = MusicPlayerModel(
    duration: -1, 
    isPlaying: false, 
    currentPosition: -1, 
    isLooping: false
  );
  MusicPlayerModel get playerModel => _playerModel;

  // timer for interval
  Timer? timer;

  Future<void> setMusic(Result music) async {
    _buffer = true;
    _playerModel = MusicPlayerModel(
      duration: -1, 
      isPlaying: false, 
      currentPosition: -1, 
      isLooping: false
    );
    notifyListeners();

    if (_music != null) {
      // if music is different than previous change the music
      if (_music?.trackId != music.trackId) {
        await releaseAudio();
        _music = music;
        if (music.previewUrl != null) {
          await playAudio();
        }
      }
    } else {
      _music = music;
      if (music.previewUrl != null) {
        await playAudio();
      }
    }

    _buffer = false;
    notifyListeners();
  }

  Future<void> playNextSong(List<Result> musics) async {
    final currentIndex = musics.indexWhere((element) => element.trackId == _music!.trackId);
    if (currentIndex < (musics.length - 1)) {
      await setMusic(musics[currentIndex + 1]);
    }
  }

  Future<void> playPrevSong(List<Result> musics) async {
    final currentIndex = musics.indexWhere((element) => element.trackId == _music!.trackId);
    if (currentIndex < (musics.length - 1) && currentIndex != 0) {
      await setMusic(musics[currentIndex - 1]);
    }
  }

  Future<void> playAudio() async {
    try {
      final result = await platform.invokeMethod('playAudio', {
        "url": _music?.previewUrl
      });
      _audioStatus = result;
    } catch (e) {
      _audioStatus = e.toString();
    }
    await getAudioInfo();
    notifyListeners();
  }

  Future<void> pauseAudio() async {
    try {
      final result = await platform.invokeMethod('pauseAudio');
      _audioStatus = result;
    } catch (e) {
      _audioStatus = e.toString();
    }
    await getAudioInfo();
    notifyListeners();
  }

  Future<void> releaseAudio() async {
    try {
      final result = await platform.invokeMethod('releaseAudio');
      _audioStatus = result;
    } catch (e) {
      _audioStatus = e.toString();
    }
  }

  Future<void> resetAudio() async {
    await releaseAudio();
    _music = null;
    _playerModel = MusicPlayerModel(
      duration: -1, 
      isPlaying: false, 
      currentPosition: -1, 
      isLooping: false
    );
    _buffer = false;
    _audioStatus = "";
    timer?.cancel();

    notifyListeners();
  }

  Future<void> getAudioInfo() async {
    try {
      timer?.cancel();
      timer = Timer.periodic(const Duration(seconds: 1), (timer) async { 
        final result = platform.invokeMethod('getAudioInfo');
        result.then((value) {
          _playerModel = MusicPlayerModel(
            duration: value['duration'] ?? -1,
            isPlaying: value['isPlaying'] ?? false,
            currentPosition: value['currentPosition'] ?? -1,
            isLooping: value['isLooping'] ?? false,
          );
          if (!_playerModel.isPlaying!) {
            timer.cancel();
          }
          notifyListeners();
        });
      });
    } catch (e) {
      log("asdasd ${e.toString()}");
    }
  }

}