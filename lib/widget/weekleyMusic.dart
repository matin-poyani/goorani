// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:video_viewer/video_viewer.dart';

// ignore: camel_case_types
class weeklyMusic extends StatefulWidget {
  const weeklyMusic({super.key});

  @override
  State<weeklyMusic> createState() => _weeklyMusicState();
}

// ignore: camel_case_types
class _weeklyMusicState extends State<weeklyMusic> {
  final VideoViewerController controller = VideoViewerController();

  final List<VideoPlayerController> _controllers = [];

  List<String> videoUrls = [
    'https://dl.rozmusic.com/Music%20Video/1402/06/29/Armin%20Zarei%20-%20Daram%20Havato%20480p_RozMusic.mp4',
    'https://dl.rozmusic.com/Music/1402/06/28/Bamdad%20-%20Tanafor_RozMusic.mp4',
    'https://dl.rozmusic.com/Music%20Video/1402/06/22/Ehaam%20-%20Parvaneh%20Var%20480p_RozMusic.mp4'
  ];

  var urlMusicVideo =
      'https://dl.rozmusic.com/Music%20Video/1402/06/22/Ehaam%20-%20Parvaneh%20Var%20480p_RozMusic.mp4';

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
      margin: const EdgeInsets.only(left: 8, right: 8),
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Text(
                'New Albums',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold, // fontSize: ,
                    color: Colors.white),
              ),
              TextButton(
                onPressed: () {
                  // ignore: todo
                  //TODO... view all music album...
                },
                child: const Text(
                  'View All',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      // fontSize: 16,
                      color: Colors.white),
                ),
              ),
            ],
          ),
          //card view in album...TODO...
          Container(
            padding: const EdgeInsets.all(
              4.0,
            ),
            child: VideoViewer(
              controller: controller,
              source: {
                "SubRip Text": VideoSource(
                  video: VideoPlayerController.network(urlMusicVideo),
                )
              },
            ),
          ),
        ],
      ),
    );
  }
}
