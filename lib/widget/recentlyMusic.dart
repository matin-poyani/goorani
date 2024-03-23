// ignore: file_names
import 'package:flutter/material.dart';


// ignore: camel_case_types
class recentlyMusic extends StatefulWidget {
  const recentlyMusic({super.key});

  @override
  State<recentlyMusic> createState() => _recentlyMusicState();
}


// ignore: camel_case_types
class _recentlyMusicState extends State<recentlyMusic> {

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 16, left: 16),
          child: const Row(
            children: [
              Text(
                'recently music',
                textAlign: TextAlign.center,
                style: TextStyle(
                  // fontFamily: 'assets/fonts/DancingScript-Bold.ttf',
                  fontSize: 16, color: Colors.white,
                ),
              ),
            ],
          ),
       ),
       Container()
      ],
    );
  }
}