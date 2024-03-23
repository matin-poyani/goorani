import 'package:flutter/material.dart';

class RecentlyMusic extends StatefulWidget {
  const RecentlyMusic({super.key});

  @override
  State<RecentlyMusic> createState() => _RecentlyMusicState();
}

class _RecentlyMusicState extends State<RecentlyMusic> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 16, left: 16),
      child: const Row(
        children: [
          Text(
            'Recently Music',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
