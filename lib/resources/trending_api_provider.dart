import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/trendingItems.dart';
import '../models/lyrics.dart';

// ignore: camel_case_types
class trendingApiProvider {
  Future<trendingItems> fetchMusicList() async {
    http.Response response = await http.get(Uri.parse(
        "https://api.musixmatch.com/ws/1.1/chart.tracks.get?apikey=009ac4514b518d0dd2b273a2a001d2c3"));
    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      return trendingItems.fromJson(json.decode(response.body));
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }

  Future<lyrics> fetchLyrics(int trackId) async {
    http.Response response = await http.get(Uri.parse(
        "https://api.musixmatch.com/ws/1.1/track.lyrics.get?track_id=$trackId&apikey=009ac4514b518d0dd2b273a2a001d2c3"));
    if (response.statusCode == 200) {
      return lyrics.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load trailers');
    }
  }
}
