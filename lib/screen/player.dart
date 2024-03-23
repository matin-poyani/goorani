import 'dart:async';

import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:goorani/models/colorstyle.dart';
import 'package:just_audio/just_audio.dart';

import '../models/duration_music_player.dart';

class Player extends StatefulWidget {
  const Player({Key? key}) : super(key: key);

  @override
  State<Player> createState() => _PlayerState();
}

class _PlayerState extends State<Player> {
  bool isPlaying = false;
  bool isFavorite = false;
  // double progressValue = 0.0;
  Duration progress = Duration.zero;
  Duration buffered = Duration.zero;
  Duration total = Duration.zero;
  late AudioPlayer _player;
  final StreamController<DurationState> _durationStateController =
  StreamController<DurationState>.broadcast();

  Stream<DurationState> get _durationState => _durationStateController.stream;

  @override
  void dispose() {
    _durationStateController.close();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      // curve: Curves.easeInOut,
      alignment: Alignment.center,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Align(
            alignment: Alignment.center,
            child: ClipOval(
              child: Image.network(
                'https://cdn.avvangmusic.ir/poster/19fcda8e-a4f1-4be4-b234-024404000b47.webp',
                height: 256,
                width: 256,
                fit: BoxFit.cover,
              ),
            ),
          ),
           const Text(
            'Artiset Title',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 8,
            ),
          ),
          const Text(
            'Song Title',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 8,
            ),
          ),

           Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
               IconButton(
                color: const ColorStyle().colorWhite,
                icon: const Icon(Icons.share_outlined),
                onPressed: () {
                  // Handle skip next
                },
              ),
              IconButton(
                icon: const Icon(Icons.sort_sharp),
                color: const ColorStyle().colorWhite,
                iconSize: 32.0,
                onPressed: () {
                  // Handle skip previous
                },
              ),
                IconButton(
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border_sharp,
                  color: isFavorite ? Colors.red : const ColorStyle().colorWhite,
                  size: 32.0,
                ),
                onPressed: () {
                  setState(() {
                    isFavorite = !isFavorite;
                    // Add your favorite logic here
                  });
                },
              ),
              IconButton(
                color: const ColorStyle().colorWhite,
                icon: const Icon(Icons.download_rounded),
                onPressed: () {
                  // Handle skip next
                },
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: StreamBuilder<DurationState>(
              stream: _durationState,
              builder: (context, snapshot) {
                final durationState = snapshot.data;
                final progress = durationState?.progress ?? Duration.zero;
                final buffered = durationState?.buffered ?? Duration.zero;
                final total = durationState?.total ?? Duration.zero;
                return ProgressBar(
                  progressBarColor: const ColorStyle().colorYellow,
                  // bufferedBarColor: const ColorStyle().colorYellow,
                  baseBarColor:  const ColorStyle().colorWhite,
                  // thumbColor:  const ColorStyle().colorYellow,
                  // thumbGlowColor:  const ColorStyle().colorYellow,
                  progress: progress,
                  buffered: buffered,
                  total: total,
                  onSeek: (duration) {
                    _player.seek(duration);
                  },
                );
              },
            ),
          ),
          //icons player...
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
               IconButton(
                color: const ColorStyle().colorYellow,
                icon: const Icon(Icons.shuffle),
                onPressed: () {
                  // Handle skip next
                },
              ),
              IconButton(
                icon: const Icon(Icons.skip_previous_outlined),
                color: const ColorStyle().colorYellow,
                iconSize: 32.0,
                onPressed: () {
                  // Handle skip previous
                },
              ),
              IconButton(
                icon: Icon(
                  isPlaying ? Icons.pause : Icons.play_circle_filled,
                  color: const ColorStyle().colorYellow,
                  size: 64.0,
                ),
                onPressed: () {
                  setState(() {
                    isPlaying = !isPlaying;
                    // Add your play/pause logic here
                  });
                },
              ),
              IconButton(
                color: const ColorStyle().colorYellow,
                icon: const Icon(Icons.skip_next_outlined),
                onPressed: () {
                  // Handle skip next
                },
              ),
              IconButton(
                color: const ColorStyle().colorYellow,
                icon: const Icon(Icons.repeat_outlined),
                onPressed: () {
                  // Handle skip next
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
