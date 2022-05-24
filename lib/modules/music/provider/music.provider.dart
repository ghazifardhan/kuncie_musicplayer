import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:kuncie_musicplayer/modules/music/models/music.model.dart';
import 'package:kuncie_musicplayer/modules/music/repositories/music.repo.dart';

class MusicProvider extends ChangeNotifier {

  // Music Repository instance
  final _musicRepo = MusicRepository();

  // loading
  bool _loading = false;
  bool get loading => _loading;

  // message when error or to inform something to ui
  String _message = "";
  String get message => _message;

  // List of music
  List<Result> _musics = [];
  List<Result> get musics => _musics;

  // Function to get music from itunes search api
  Future<void> getMusics({
    String? search
  }) async {
    try {
      // empty list of music first
      _musics.clear();

      // set loading to true to update ui
      _loading = true;
      notifyListeners();

      final response = await _musicRepo.getMusic(search: search);
      if (response.results!.isNotEmpty) {
        _musics.addAll(response.results!);
      }
      // set loading to false when api fetched
      _loading = false;
      notifyListeners();
    } on DioError catch (e) {
      // set loading to false when api fetched
      _loading = false;

      // set message to catch variable
      _message = e.message;
      notifyListeners();
    } on SocketException catch (e) {
      // set loading to false when api fetched
      _loading = false;

      // set message to catch variable
      _message = e.message;
      notifyListeners();
    } catch (e) {
      // set loading to false when api fetched
      _loading = false;

      // set message to catch variable
      _message = e.toString();
      notifyListeners();
    }
  }
}