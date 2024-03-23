import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';

import '../Api/music_Api_Service.dart';
import '../models/Music_Track_Page.dart';
import '../models/colorstyle.dart';

class MySearchBar extends StatefulWidget {
  const MySearchBar({Key? key}) : super(key: key);

  @override
  State<MySearchBar> createState() => _MySearchBarState();
}

class _MySearchBarState extends State<MySearchBar> {
  String searchValue = '';
  final List<String>   _suggestions = [];

  Future<List<String>> _fetchSuggestions(String searchValue) async {
    try {
      final musicApiService = MusicApiService();
      final musicTracks = await musicApiService.fetchData();

      final suggestions = musicTracks.where((track) {
        return track.title.toLowerCase().contains(searchValue.toLowerCase());
      }).map((track) => track.title).toList();

      return suggestions;
    } catch (e) {
      print('Error fetching suggestions: $e');
      return [];
    }
  }



  void navigateToMusicTrackPage(String trackTitle) {
    // اینجا می‌توانید کد لازم برای انتقال به صفحه جدید (مثلاً MusicTrackPage) را قرار دهید
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => MusicTrackPage(trackTitle: trackTitle)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scaffold(
        appBar: EasySearchBar(
            iconTheme: const IconThemeData(color: Colors.yellow),
            searchHintText: 'Search...',
            searchTextStyle: TextStyle(color: const ColorStyle().colorYellow),
            searchHintStyle: TextStyle(color: const ColorStyle().colorYellow),
            searchBackgroundColor: const ColorStyle().colorDark,
            backgroundColor: const ColorStyle().colorDark,
            title:
            const Text('TANIN', style: TextStyle(color: Colors.yellow)),
            onSearch: (value) async {
              List<String> suggestions = await _fetchSuggestions(value);
              return suggestions;
            },
            actions: [
              IconButton(
                  icon: const Icon(Icons.person),
                  // color: const ColorStyle().colorYellow,
                  onPressed: () {})
            ],
            asyncSuggestions: (value) async =>
            await _fetchSuggestions(value)),
        drawer: Drawer(
            child: ListView(padding: EdgeInsets.zero, children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text('Drawer Header'),
              ),
              ListTile(
                  title: const Text('Item 1'),
                  onTap: () => Navigator.pop(context)),
              ListTile(
                  title: const Text('Item 2'),
                  onTap: () => Navigator.pop(context))
            ])),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: _suggestions.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(_suggestions[index]),
                    onTap: () {
                      // Handle the selection of a music track
                      navigateToMusicTrackPage(_suggestions[index]);
                    },
                  );
                },
              ),
            ),
            Center(child: Text('Value: $searchValue')),
          ],
        ),
      ),
    );
  }
}