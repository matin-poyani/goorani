import 'package:flutter/material.dart';

class MusicDetailsPage extends StatefulWidget {
  final String selectedTrack;

  MusicDetailsPage(this.selectedTrack);

  @override
  State<MusicDetailsPage> createState() => _MusicDetailsPageState();
}

class _MusicDetailsPageState extends State<MusicDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.selectedTrack),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Display music details, image, text, etc.
            // Add a player widget to play the selected track
            // Mini player screen can be added here as well
          ],
        ),
      ),
    );
  }
}
