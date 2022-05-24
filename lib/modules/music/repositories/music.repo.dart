import 'dart:convert';
import 'dart:developer';

import 'package:kuncie_musicplayer/api/api.dart';
import 'package:kuncie_musicplayer/modules/music/models/music.model.dart';

class MusicRepository {

  Future<MusicResultModel> getMusic({
    String? search
  }) async {
    final response = await Api().itunesApi.get(
      '/search',
      queryParameters: {
        "term": search,
        "entity": "song"
      }
    );
    return MusicResultModel.fromJson(json.decode(response.data));
  }
  
}