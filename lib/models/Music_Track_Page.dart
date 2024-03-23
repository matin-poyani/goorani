import 'package:flutter/material.dart';

class MusicTrackPage extends StatelessWidget {
  final String trackTitle;

  const MusicTrackPage({super.key, required this.trackTitle});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Music Track Details'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Track Title: $trackTitle'),
            // اضافه کردن اطلاعات دیگر آهنگ در اینجا
          ],
        ),
      ),
    );
  }
}
