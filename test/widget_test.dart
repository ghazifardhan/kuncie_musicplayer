// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:test/test.dart';

import 'package:kuncie_musicplayer/main.dart';
import 'package:kuncie_musicplayer/modules/music/models/music.model.dart';
import 'package:kuncie_musicplayer/modules/music/provider/music_player.provider.dart';



void main() {
  group('$MusicPlayerProvider', () {
    final _musicPlayerProvider = MusicPlayerProvider();
    Result music = Result(
      trackId: 1,
      previewUrl: "https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview112/v4/8a/27/1a/8a271a66-2003-c55c-e296-fcddea61108b/mzaf_8367689080899458478.plus.aac.p.m4a"
    );

    test('Audio must be played', () async {
      await _musicPlayerProvider.setMusic(music);
      expect(_musicPlayerProvider.buffer, false);
    });

    test('Audio must be stopped', () async {
      await _musicPlayerProvider.pauseAudio();
      expect(_musicPlayerProvider.playerModel.isPlaying, false);
    });
  });
}
