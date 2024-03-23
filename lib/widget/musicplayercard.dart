import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MusicPlayerCard extends StatefulWidget {
  final String url;
  final String title;
  final String artist;
  final String albumArt;

  const MusicPlayerCard({
    super.key,
    required this.url,
    required this.title,
    required this.artist,
    required this.albumArt,
  });

  @override
  // ignore: library_private_types_in_public_api
  _MusicPlayerCardState createState() => _MusicPlayerCardState();
}

class _MusicPlayerCardState extends State<MusicPlayerCard> {


<<<<<<< HEAD:lib/widget/musicplayercard.dart
  final AudioPlayer _audioPlayer = AudioPlayer();
=======
  // final AudioPlayer _audioPlayer = AudioPlayer();
>>>>>>> 9e54a20 (music gorani player):lib/screen/musicplayercard.dart
  final Duration _duration = const Duration();
  Duration _position = const Duration();
  bool _isPlaying = false;


  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child:
        Card(
      child: Column(
        children: <Widget>[
          SvgPicture.network(
            widget.albumArt,
            width: 200,
            height: 200,
          ),
          Text(widget.title),
          Text(widget.artist),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              IconButton(
                icon: const Icon(Icons.play_arrow),
                onPressed: () {
                  if (!_isPlaying) {
                    _audioPlayer.play(widget.url as Source);
                    setState(() => _isPlaying = true);
                  } else {
                    _audioPlayer.pause();
                    setState(() => _isPlaying = false);
                  }
                },
              ),
              IconButton(
                icon: const Icon(Icons.stop),
                onPressed: () {
                  _audioPlayer.stop();
                  setState(() {
                    _isPlaying = false;
                    _position = const Duration();
                  });
                },
              ),
            ],
          ),
          Slider(
            value: _position.inSeconds.toDouble(),
            min: 0,
            max: _duration.inSeconds.toDouble(),
            onChanged: (double value) {
              setState;
            },
          ),
        ],
      ),
        )
    );
  }
}
