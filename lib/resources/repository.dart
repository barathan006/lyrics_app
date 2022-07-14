import 'dart:async';
import 'package:lyrics_app/models/lyrics.dart';

import 'trending_api_provider.dart';
import '../models/trendingItems.dart';

class Repository {
  final musicApiProvider = trendingApiProvider();

  Future<trendingItems> fetchAllMusic() => musicApiProvider.fetchMusicList();
  Future<lyrics> fetchLyrics(int trackId) =>
      musicApiProvider.fetchLyrics(trackId);
}
