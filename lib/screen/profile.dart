import 'package:flutter/material.dart';
import 'package:goorani/models/colorstyle.dart';
import 'package:goorani/widget/Mini_Player_Screen.dart';
import 'package:goorani/widget/bottom_navigation_bar.dart';

import '../widget/searchbar.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const ColorStyle().colorDark,
      appBar: AppBar(
        actions: const [
          //icon search music home page
          MySearchBar(),
        ],
      ),
      bottomNavigationBar:  const MyBottomNavigationBar(),
      bottomSheet: const MiniPlayerScreen(),
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 64, left: 16),
            child: Text(
              'Library',
              style: TextStyle(fontSize: 8,color: Colors.white), // Adjust font size as needed
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: GestureDetector(
              onTap: () {
                // Add onRowClick logic here
              },
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.library_music_outlined,
                    size: 32.0,
                    color: const ColorStyle().colorWhite,
                  ),
                  const Text(
                    'My PlayList',
                    style: TextStyle(fontSize: 8, color: Colors.white),
                  ),
                  Icon(
                    Icons.keyboard_arrow_right,
                    size: 32.0,
                    color: const ColorStyle().colorWhite,
                  ),
                ],
              ),
            ),
          ),
                  //Albums...
                  Padding(
            padding: const EdgeInsets.all(16.0),
            child: GestureDetector(
              onTap: () {
                // Add onRowClick logic here
              },
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.album_outlined,
                    size: 32.0,
                    color: const ColorStyle().colorWhite,
                  ),
                  const Text(
                    'Album',
                    style: TextStyle(fontSize: 8, color: Colors.white),
                  ),
                  Icon(
                    Icons.keyboard_arrow_right,
                    size: 32.0,
                    color: const ColorStyle().colorWhite,
                  ),
                ],
              ),
            ),
          ),
          //MV...musicVideo
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: GestureDetector(
              onTap: () {
                // Add onRowClick logic here
              },
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.video_library_outlined,
                    size: 32.0,
                    color: const ColorStyle().colorWhite,
                  ),
                  const Text(
                    'Music Video',
                    style: TextStyle(fontSize: 8, color: Colors.white),
                  ),
                  Icon(
                    Icons.keyboard_arrow_right,
                    size: 32.0,
                    color: const ColorStyle().colorWhite,
                  ),
                ],
              ),
            ),
          ),
          //Artist...
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: GestureDetector(
              onTap: () {
                // Add onRowClick logic here
              },
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.recent_actors_outlined,
                    size: 32.0,
                    color: const ColorStyle().colorWhite,
                  ),
                  const Text(
                    'Artist',
                    style: TextStyle(fontSize: 8, color: Colors.white),
                  ),
                  Icon(
                    Icons.keyboard_arrow_right,
                    size: 32.0,
                    color: const ColorStyle().colorWhite,
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: GestureDetector(
              onTap: () {
                // Add onRowClick logic here
              },
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(
                    Icons.save_alt_outlined,
                    size: 32.0,
                    color: const ColorStyle().colorWhite,
                  ),
                  const Text(
                    'Download',
                    style: TextStyle(fontSize: 8, color: Colors.white),
                  ),
                  Icon(
                    Icons.keyboard_arrow_right,
                    size: 32.0,
                    color: const ColorStyle().colorWhite,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
