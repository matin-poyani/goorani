import 'package:flutter/material.dart';
import 'package:miniplayer/miniplayer.dart';

import 'bottom_navigation_bar.dart';

class MiniPlayer extends StatefulWidget {
  @override
  _MiniPlayerState createState() => _MiniPlayerState();
}

class _MiniPlayerState extends State<MiniPlayer> {
  bool isPlaying = false;
  MiniplayerController controller = MiniplayerController();

@override
Widget build(BuildContext context) {
  final double playerMinHeight = MediaQuery.of(context).size.width * 0.2; // Adjust the percentage as needed
  final double playerMaxHeight = MediaQuery.of(context).size.height;

  // Get the current time
  DateTime now = DateTime.now();
  int currentHour = now.hour;

  return SingleChildScrollView(
    child: SizedBox(
      child: Row(
        children: [
          Miniplayer(
            controller: controller,
            duration: const Duration(seconds: 1),
            minHeight: playerMinHeight,
            maxHeight: playerMaxHeight,
            builder: (height, percentage) {
              if (height < playerMinHeight) {
                return SizedBox(height: playerMinHeight);
              }
                    
              bool isExpanded = height > playerMinHeight;
              double imageSize = isExpanded ? 200 : 75;
              double opacity =
                  ((height - playerMinHeight) / (playerMaxHeight - playerMinHeight)).clamp(0.0, 1.0);
                    
              return AnimatedContainer(
                  duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                      alignment: isExpanded ? Alignment.bottomCenter : Alignment.center,
                child: Column(
                  children: [
                    if (isExpanded)
                      Opacity(
                        opacity: opacity,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: Text(
                            'Song Title',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16 + 8 * opacity,
                            ),
                          ),
                        ),
                      ),
                    if (isExpanded && currentHour >= 8 && currentHour <= 20) // Adjust the time range as needed
                      Expanded(
                        child: Align(
                          alignment: isExpanded ? Alignment.center : Alignment.center,
                          child: Image.network(
                            'https://cdn.avvangmusic.ir/poster/19fcda8e-a4f1-4be4-b234-024404000b47.webp',
                            height: imageSize,
                            width: imageSize,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    if (isExpanded) const SizedBox(height: 16.0),
                    IconButton(
                      icon: const Icon(Icons.skip_previous_outlined),
                      onPressed: () {
                        // Handle skip previous
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        isPlaying ? Icons.pause : Icons.play_arrow,
                        size: 35.0,
                      ),
                      onPressed: () {
                        setState(() {
                          isPlaying = !isPlaying;
                          // Add your play/pause logic here
                        });
                      },
                    ),
                    IconButton(
                      icon: const Icon(Icons.skip_next_outlined),
                      onPressed: () {
                        // Handle skip next
                      },
                    ),
                  ],
                ),
              );
            },
          ),
          const MyBottomNavigationBar(),
        ],
      ),
    ),
  );
}
}