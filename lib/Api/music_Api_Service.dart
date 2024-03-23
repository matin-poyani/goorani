import 'dart:convert';
import 'package:http/http.dart' as http;
import 'music_track.dart';

class MusicApiService {


  Future<List<MusicTrack>> fetchData() async {
    try {
      final response =
          await http.get(Uri.parse('https://avvangmusic.ir/api/index'));
      print('API Response: ${response.body}'); // Add this line
      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        List<MusicTrack> musicTracks =
            data.map((e) => MusicTrack.fromJson(e)).toList();
        return musicTracks;
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error fetching data: $e'); // Add this line
      throw e; // Re-throw the error
    }
  }
}
