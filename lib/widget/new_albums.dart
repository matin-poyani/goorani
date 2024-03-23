import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import '../Api/music_Api_Service.dart';
import '../Api/music_track.dart';

class NewAlbums extends StatefulWidget {
  const NewAlbums({super.key});

  @override
  State<NewAlbums> createState() => _NewAlbumsState();
}

class _NewAlbumsState extends State<NewAlbums> {
  List<MusicTrack> musicTracks = [];

  final MusicApiService apiService = MusicApiService();

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    try {
      List<MusicTrack> fetchedData = await apiService.fetchData();
      setState(() {
        musicTracks = fetchedData;
      });
    } catch (e) {
      print('Error fetching data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          child: const Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'New Albums',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              Text(
                'View All',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          child: CarouselSlider(
            options: CarouselOptions(
              autoPlay: true,
              aspectRatio: 15 / 9,
              enlargeCenterPage: true,
              autoPlayCurve: Curves.decelerate,
            ),
            items: musicTracks
                .map((item) => Container(
                      margin: const EdgeInsets.all(5.0),
                      child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5.0)),
                          child: Stack(
                            children: <Widget>[
                              Image.network(
                                item.musicPoster.isNotEmpty
                                    ? item.musicPoster
                                    : 'https://cdn.avvangmusic.ir/poster/19fcda8e-a4f1-4be4-b234-024404000b47.webp', // Replace with your placeholder image URL
                                fit: BoxFit.cover,
                                width: double.infinity,
                                loadingBuilder: (BuildContext context,
                                    Widget child,
                                    ImageChunkEvent? loadingProgress) {
                                  if (loadingProgress == null) {
                                    return child;
                                  } else {
                                    return Center(
                                      child: CircularProgressIndicator(
                                        value: loadingProgress
                                                    .expectedTotalBytes !=
                                                null
                                            ? loadingProgress
                                                    .cumulativeBytesLoaded /
                                                loadingProgress
                                                    .expectedTotalBytes!
                                            : null,
                                      ),
                                    );
                                  }
                                },
                              ),
                              Positioned(
                                bottom: 0.0,
                                left: 0.0,
                                right: 0.0,
                                child: Container(
                                  decoration: const BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [
                                        Color.fromARGB(200, 0, 0, 0),
                                        Color.fromARGB(0, 0, 0, 0)
                                      ],
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                    ),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 20.0),
                                ),
                              ),
                            ],
                          )),
                    ))
                .toList(),
          ),
        ),
      ],
    );
  }
}
